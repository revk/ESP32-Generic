/* Generic app */
/* Copyright ©2019 - 2022 Adrian Kennard, Andrews & Arnold Ltd.See LICENCE file for details .GPL 3.0 */
/* This has a wide range of example stuff in it that does not in itself warrant a separate project */
/* Including UART logging and debug for Daikin air-con */
/* Including display text and QR code */
/* Including SolarEdge monitor */
/* Including DEFCON mode - DEFCON/x on mqtt, or ?x on http, where x=1-5 for normal, 0 for special all on, 6-8 for all off, 9 for all off and quiet and no blink */

static const char TAG[] = "Generic";

#include "revk.h"
#include "esp_system.h"
#include "esp_timer.h"
#include "esp_sleep.h"
#include "esp_task_wdt.h"
#include "esp_http_client.h"
#include "esp_http_server.h"
#include "esp_crt_bundle.h"
#include "vl53l0x.h"
#include "vl53l1x.h"
#include "gfx.h"
#include "iec18004.h"
#include <hal/spi_types.h>
#include <driver/gpio.h>
#include <driver/uart.h>
#include <driver/ledc.h>
#include <driver/i2c.h>
#include <esp_now.h>
#include <onewire_bus.h>
#include <ds18b20.h>
#include <math.h>
#include "lora.h"
#if 0
#include <esp_adc/adc_cali.h>
#endif

#ifndef	CONFIG_LWIP_DHCP_RESTORE_LAST_IP
#warning CONFIG_LWIP_DHCP_RESTORE_LAST_IP may improve speed
#endif
#ifndef	CONFIG_BOOTLOADER_SKIP_VALIDATE_IN_DEEP_SLEEP
#warning CONFIG_BOOTLOADER_SKIP_VALIDATE_IN_DEEP_SLEEP may speed boot
#endif
#if	CONFIG_BOOTLOADER_LOG_LEVEL > 0
#warning CONFIG_BOOTLOADER_LOG_LEVEL recommended to be no output
#endif

static uint32_t outputmark[MAXGPIO];    //Output mark time(ms)
static uint32_t outputspace[MAXGPIO];   //Output mark time(ms)
int holding = 0;
int refresh = 0;

// Dynamic
static uint64_t volatile outputbits = 0;        // Requested output
static uint64_t volatile outputraw = 0; // Current output
static uint64_t volatile outputoverride = 0;    // Override output (e.g. PWM)
static uint32_t outputremaining[MAXGPIO] = { }; //Output remaining time(ms)
static uint32_t outputcount[MAXGPIO] = { };     //Output count

int64_t busy = 0;
char usb_present = 0;
char charger_present = 0;
const char *rangererr = NULL;
uint16_t range = 0;
uint32_t voltage = 0;
httpd_handle_t webserver = NULL;
int8_t defcon_level = 9;

void
ds18b20_task (void *arg)
{
   ESP_LOGE (TAG, "DS18B20 %d", ds18b20.num);
   onewire_bus_config_t bus_config = { ds18b20.num,.flags = {0} };
   onewire_bus_rmt_config_t rmt_config = { 20 };
   onewire_bus_handle_t bus_handle = { 0 };
   REVK_ERR_CHECK (onewire_new_bus_rmt (&bus_config, &rmt_config, &bus_handle));
   onewire_device_iter_handle_t iter = { 0 };
   REVK_ERR_CHECK (onewire_new_device_iter (bus_handle, &iter));
   onewire_device_t dev = { };
   int found = 0;
   while (!onewire_device_iter_get_next (iter, &dev))
   {
      ESP_LOGE (TAG, "Found %llX", dev.address);
      found++;
   }
   if (!found)
      vTaskDelete (NULL);
   ds18b20_config_t config = { };
   ds18b20_device_handle_t handle = { 0 };
   REVK_ERR_CHECK (ds18b20_new_device (&dev, &config, &handle));
   REVK_ERR_CHECK (ds18b20_set_resolution (handle, DS18B20_RESOLUTION_12B));
   while (1)
   {
      sleep (1);
      float temp = NAN;
      REVK_ERR_CHECK (ds18b20_trigger_temperature_conversion (handle));
      REVK_ERR_CHECK (ds18b20_get_temperature (handle, &temp));
      jo_t j = jo_object_alloc ();
      jo_litf (j, "ds18b20", "%016lX", dev.address);
      jo_litf (j, "temp", "%.2f", temp);
      revk_info ("uart", &j);
   }
}

volatile uint8_t uarts = 1;
void
uart_task (void *arg)
{
   revk_gpio_t rx = *(revk_gpio_t *) arg;
   uint8_t uart = uarts++;
   esp_err_t err = 0;
   uart_config_t uart_config = {
      .baud_rate = s21 ? 2400 : 9600,
      .data_bits = UART_DATA_8_BITS,
      .parity = UART_PARITY_DISABLE,
      .stop_bits = UART_STOP_BITS_1,
      .flow_ctrl = UART_HW_FLOWCTRL_DISABLE,
      .source_clk = UART_SCLK_DEFAULT,
   };
   if (!err)
      err = uart_param_config (uart, &uart_config);
   if (!err)
      err = uart_set_pin (uart, -1, rx.num, -1, -1);
   if (!err)
      err = uart_driver_install (uart, 1024, 0, 0, NULL, 0);
   if (err)
   {
      jo_t j = jo_object_alloc ();
      jo_string (j, "error", "Failed to uart");
      jo_int (j, "uart", uart);
      jo_int (j, "gpio", rx.num);
      jo_string (j, "description", esp_err_to_name (err));
      revk_error ("uart", &j);
      return;
   }
   while (1)
   {
      uint8_t buf[256];
      int len = 0;
      if (s21)
      {
         len = uart_read_bytes (uart, buf, 1, 10 / portTICK_PERIOD_MS);
         if (len == 1)
         {                      // Start
            if (*buf == 6)
               len = 0;         // ACK
            else
               while (len < sizeof (buf))
               {
                  if (uart_read_bytes (uart, buf + len, 1, 100 / portTICK_PERIOD_MS) <= 0)
                     break;
                  len++;
                  if (buf[len - 1] == 3)
                     break;     // End
               }
         }
      } else
         len = uart_read_bytes (uart, buf, sizeof (buf), 10 / portTICK_PERIOD_MS);
      if (len <= 0)
         continue;
      jo_t j = jo_object_alloc ();
      if (daikin)
      {                         // Daikin debug
         if (s21)
         {
            uint8_t c = 0;
            for (int i = 1; i < len - 2; i++)
               c += buf[i];
            if (buf[len - 2] != c)
            {
               jo_stringf (j, "badsum", "%02X", c);
               jo_base16 (j, "raw", buf, len);
            }
            if (len < 5)
            {
               jo_bool (j, "badlen", 1);
               jo_base16 (j, "raw", buf, len);
            }
            jo_stringf (j, uart == 1 ? "tx" : "rx", "%c", buf[1]);
            jo_stringf (j, "cmd", "%c", buf[2]);
            if (len > 5)
            {
               int i;
               for (i = 3; i < len - 2 && ((buf[i] >= 0x20 && buf[i] <= 0x7E) || buf[i] == 0xFF); i++);
               if (i < len - 2)
                  jo_base16 (j, "data", buf + 3, len - 5);
               else
                  jo_stringn (j, "value", (char *) buf + 3, len - 5);
            }
         } else
         {
            uint8_t c = 0;
            for (int i = 0; i < len; i++)
               c += buf[i];
            if (c != 0xFF)
               jo_bool (j, "badsum", 1);
            if (len < 6 || buf[2] != len)
               jo_bool (j, "badlen", 1);
            if (buf[0] != 6 || buf[3] != 1)
               jo_bool (j, "badhead", 1);
            jo_stringf (j, uart == 1 ? "tx" : "rx", "%02X", buf[1]);
            if (buf[4] != (uart == 1 ? 0 : 6))
               jo_stringf (j, "tag", "%02X", buf[4]);
            if (len > 6)
               jo_base16 (j, "data", buf + 5, len - 6);
         }
      } else
      {
         jo_int (j, "uart", uart);
         jo_int (j, "gpio", rx.num);
         jo_int (j, "len", len);
         jo_base16 (j, "data", buf, len);
      }
      revk_info ("uart", &j);
   }
}

static void
als_task (void *arg)
{
   ESP_LOGI (TAG, "ALS start %d:%02X", i2c, als & 0x7F);
   uint16_t r (uint8_t cmd)
   {
      uint8_t l,
        h;
      i2c_cmd_handle_t t = i2c_cmd_link_create ();
      i2c_master_start (t);
      i2c_master_write_byte (t, (als << 1) | I2C_MASTER_WRITE, true);
      i2c_master_write_byte (t, cmd, true);
      i2c_master_start (t);
      i2c_master_write_byte (t, (als << 1) | I2C_MASTER_READ, true);
      i2c_master_read_byte (t, &l, I2C_MASTER_ACK);
      i2c_master_read_byte (t, &h, I2C_MASTER_LAST_NACK);
      i2c_master_stop (t);
      esp_err_t err = i2c_master_cmd_begin (i2c, t, 10 / portTICK_PERIOD_MS);
      i2c_cmd_link_delete (t);
      if (err)
      {
         ESP_LOGE (TAG, "ALS %02X read fail %s", cmd, esp_err_to_name (err));
         jo_t j = jo_object_alloc ();
         jo_string (j, "error", "Failed to ALS read");
         jo_int (j, "cmd", cmd);
         jo_int (j, "sda", sda.num);
         jo_int (j, "scl", scl.num);
         jo_int (j, "address", als & 0x7F);
         jo_string (j, "description", esp_err_to_name (err));
         revk_error ("als", &j);
         return 0;
      }
      return (h << 8) + l;
   }
   void w (uint8_t cmd, uint16_t val)
   {
      i2c_cmd_handle_t t = i2c_cmd_link_create ();
      i2c_master_start (t);
      i2c_master_write_byte (t, (als << 1) | I2C_MASTER_WRITE, true);
      i2c_master_write_byte (t, cmd, true);
      i2c_master_write_byte (t, val & 0xFF, true);
      i2c_master_write_byte (t, val >> 8, true);
      i2c_master_stop (t);
      esp_err_t err = i2c_master_cmd_begin (i2c, t, 10 / portTICK_PERIOD_MS);
      i2c_cmd_link_delete (t);
      if (err)
      {
         ESP_LOGE (TAG, "ALS %02X write %04X fail %s", cmd, val, esp_err_to_name (err));
         jo_t j = jo_object_alloc ();
         jo_string (j, "error", "Failed to ALS read");
         jo_int (j, "cmd", cmd);
         jo_int (j, "sda", sda.num);
         jo_int (j, "scl", scl.num);
         jo_int (j, "address", als & 0x7F);
         jo_string (j, "description", esp_err_to_name (err));
         revk_error ("als", &j);
         return;
      }
   }
   {                            // Check ID
      uint16_t id = r (0x09);
      if ((id & 0xFF) != 0x35)
      {
         ESP_LOGE (TAG, "ALS Bad ID %04X", id);
         vTaskDelete (NULL);
         return;
      }
   }
   w (0x00, 0x0040);
   ESP_LOGI (TAG, "ALS mode=%04X ", r (0x00));
   while (1)
   {

      ESP_LOGI (TAG, "ALS W=%04X ALS=%04X", r (0x04), r (0x05));
      sleep (1);
   }
}

static uint8_t
lora_start (void)
{
   esp_err_t e = lora_init ();
   if (!e)
   {
      ESP_LOGE (TAG, "LoRA not started");
      return e;
   }
   lora_set_frequency (1000000UL * lorafreq);
   lora_set_coding_rate (loracr);
   lora_set_bandwidth (lorabw);
   lora_set_spreading_factor (lorasf);
   lora_set_tx_power (lorapower);
   lora_explicit_header_mode ();
   lora_enable_crc ();
   ESP_LOGE (TAG, "LoRa cr %d bw %d sf %d tx %d", loracr, lorabw, lorasf, lorapower);
   return 1;
}


static void
lora_rx_task (void *arg)
{
   uint8_t buf[255];            // Maximum Payload size of SX1276/77/78/79 is 255
   ESP_LOGE (TAG, "LoRa Rx start");
   while (1)
   {
      lora_receive ();
      if (lora_received ())
      {
         int rxlen = lora_receive_packet (buf, sizeof (buf));
         ESP_LOG_BUFFER_HEX_LEVEL (TAG, buf, rxlen, ESP_LOG_ERROR);
      }
      vTaskDelay (1);           // Avoid WatchDog alerts
   }
}

static void
web_head (httpd_req_t * req, const char *title)
{
   revk_web_head (req, title);
   httpd_resp_sendstr_chunk (req, "<style>"     //
                             "a.defcon{text-decoration:none;border:1px solid black;border-radius:50%;margin:2px;padding:3px;display:inline-block;width:1em;text-align:center;}" //
                             "a.on{border:3px solid black;}"    //
                             "a.d1{background-color:white;}"    //
                             "a.d2{background-color:red;}"      //
                             "a.d3{background-color:yellow;}"   //
                             "a.d4{background-color:green;color:white;}"        //
                             "a.d5{background-color:blue;color:white;}" //
                             "body{font-family:sans-serif;background:#8cf;}"    //
                             "</style><body><h1>");
   if (title)
      httpd_resp_sendstr_chunk (req, title);
   httpd_resp_sendstr_chunk (req, "</h1>");
}

static esp_err_t
web_icon (httpd_req_t * req)
{                               // serve image -  maybe make more generic file serve
   extern const char start[] asm ("_binary_apple_touch_icon_png_start");
   extern const char end[] asm ("_binary_apple_touch_icon_png_end");
   httpd_resp_set_type (req, "image/png");
   httpd_resp_send (req, start, end - start);
   return ESP_OK;
}

static esp_err_t
web_root (httpd_req_t * req)
{
   if (revk_link_down ())
      return revk_web_settings (req);   // Direct to web set up
   web_head (req, *hostname ? hostname : appname);
   if (defcon)
   {                            // Defcon controls
      size_t len = httpd_req_get_url_query_len (req);
      char q[2] = { };
      if (len == 1)
      {
         httpd_req_get_url_query_str (req, q, sizeof (q));
         if (isdigit ((int) *q))
            defcon_level = *q - '0';
         else if (*q == '+' && defcon_level < 9)
            defcon_level++;
         else if (*q == '-' && defcon_level > 0)
            defcon_level--;
      }
      for (int i = 0; i <= 9; i++)
         if (i <= 6 || i == 9)
         {
            q[0] = '0' + i;
            httpd_resp_sendstr_chunk (req, "<a href='?");
            httpd_resp_sendstr_chunk (req, q);
            httpd_resp_sendstr_chunk (req, "' class='defcon d");
            httpd_resp_sendstr_chunk (req, q);
            if (i == defcon_level)
               httpd_resp_sendstr_chunk (req, " on");
            httpd_resp_sendstr_chunk (req, "'>");
            httpd_resp_sendstr_chunk (req, i == 9 ? "X" : q);
            httpd_resp_sendstr_chunk (req, "</a>");
         }
   }
   return revk_web_foot (req, 0, 1, NULL);
}

void
defcon_task (void *arg)
{
   // Expects outputs to be configured
   // 0=Beep - set mark/space
   // 1-5=DEFCON lights White/Red/Yellow/Green/Blue
   // 6=Click
   // 7=Blink - set mark/space
   // The defcon setting is lowest DEFCON setting that we don't beep for, e.g. 5 would be good not to beep when going to DEFCON 5 or above
   outputcount[7] = -1;         // Blinking forever - set mark/space
   outputbits |= (1 << 7);      // Start blinking
   int8_t level = -1;           // Current DEFCON level
   while (1)
   {
      usleep (10000);
      if (level != defcon_level)
      {
         usleep (100000);
         if (level != defcon_level)
         {
            uint8_t click = (1 << 6);
            uint8_t blink = (1 << 7);
            if (level >= 9 || defcon_level >= 9)
               click = 0;
            if (defcon_level >= defconblink)
               blink = 0;
            int8_t waslevel = level;
            level = defcon_level;
            // Off existing
            outputbits = (outputbits & ~0x7F) | click | blink;
            outputcount[7] = (blink ? -1 : 0);
            usleep (500000);
            // Report
            jo_t j = jo_object_alloc ();
            jo_int (j, "level", level);
            revk_info ("defcon", &j);
            // Beep count
            if (level < defcon && click)
               outputcount[0] = waslevel < level ? 1 : level ? 2 : 3;   // To/from level 9 is silent
            // On new
            outputbits = (outputbits & ~0x7F) | (level > 5 ? 0 : level ? (1 << level) : (1 << 1)) | (outputcount[0] ? (1 << 0) : 0);
            if (!level)
               for (int i = 2; i <= 5; i++)
               {
                  usleep (100000);
                  outputbits = (outputbits ^ click) | (1 << i);
               }
            sleep (1);
         }
      }
   }
}


void
se_task (void *arg)
{                               // Solar edge monitor
   char *url = NULL;
   int max = 5000;
   char *buf = malloc (max);
   jo_t fetch (const char *url)
   {
      jo_t j = NULL;
      esp_http_client_config_t config = {
         .url = url,
         .crt_bundle_attach = esp_crt_bundle_attach,
      };
      esp_http_client_handle_t client = esp_http_client_init (&config);
      if (!client)
         return NULL;
      if (!esp_http_client_open (client, 0))
      {
         if (esp_http_client_fetch_headers (client) >= 0)
         {
            int len = esp_http_client_read_response (client, buf, max);
            if (len > 0 && len <= max)
               j = jo_parse_mem (buf, len);
         }
         esp_http_client_close (client);
      }
      REVK_ERR_CHECK (esp_http_client_cleanup (client));
      return j;
   }
   char city[17];
   jo_t j;
   asprintf (&url, "https://monitoringapi.solaredge.com/site/%ld/details?api_key=%s", sesite, sekey);
   while (1)
   {
      sleep (5);
      if (revk_link_down ())
         continue;
      if ((j = fetch (url)))
      {
         if (jo_find (j, "*.location.city") == JO_STRING)
            jo_strncpy (j, city, sizeof (city));
         jo_free (&j);
         break;
      } else
         sleep (60);
   }
   free (url);
#ifndef	CONFIG_GFX_NONE
   time_t last = 0;
   float today = 0;
   if (url && buf)
      while (1)
      {
         char unit[3] = "";
         float pv = 0,
            load = 0;
         time_t this = time (0);
         if (last / 15 / 60 != this / 15 / 60)
         {                      // Stats
            last = this;
            asprintf (&url, "https://monitoringapi.solaredge.com/site/%ld/overview?api_key=%s", sesite, sekey);
            if ((j = fetch (url)))
            {
               if (jo_find (j, "*.lastDayData.energy") == JO_NUMBER)
                  today = jo_read_float (j);
            }
            free (url);
         }
         asprintf (&url, "https://monitoringapi.solaredge.com/site/%ld/currentPowerFlow?api_key=%s", sesite, sekey);
         if ((j = fetch (url)))
         {
            if (jo_find (j, "*.unit") == JO_STRING)
               jo_strncpy (j, unit, sizeof (unit));
            if (jo_find (j, "*.PV.currentPower") == JO_NUMBER)
               pv = jo_read_float (j) * 1000;
            if (jo_find (j, "*.LOAD.currentPower") == JO_NUMBER)
               load = jo_read_float (j) * 1000;
            jo_free (&j);
         }
         free (url);
         // Log
         j = jo_object_alloc ();
         jo_int (j, "site", sesite);
         jo_string (j, "city", city);
         jo_litf (j, "pv", "%.2f", pv / 1000);
         jo_litf (j, "load", "%.2f", load / 1000);
         jo_litf (j, "today", "%.3f", today / 1000);
         jo_string (j, "unit", unit);
         revk_info ("solaredge", &j);
         // Display
         gfx_lock ();
         gfx_clear (0);
         gfx_pos (gfx_width () / 2, 0, GFX_T | GFX_C | GFX_V);
         gfx_text (GFX_TEXT_DESCENDERS, 2, "%s", city);
         gfx_fill (gfx_width (), 1, 255);
         gfx_pos (gfx_x (), gfx_y () + 2, gfx_a ());
         gfx_text (GFX_TEXT_DESCENDERS, 2, "Generation");
         if (pv < 1000 && *unit == 'k')
            gfx_text (0, 5, "%.0f%s", pv, unit + 1);
         else
            gfx_text (0, 5, "%.2f%s", pv / 1000, unit);
         gfx_text (GFX_TEXT_DESCENDERS, 2, "Consumption");
         if (load < 1000 && *unit == 'k')
            gfx_text (0, 5, "%.0f%s", load, unit + 1);
         else
            gfx_text (0, 5, "%.2f%s", load / 1000, unit);
         gfx_fill (gfx_width (), 1, 255);
         gfx_pos (gfx_x (), gfx_y () + 2, gfx_a ());
         gfx_text (GFX_TEXT_DESCENDERS, 2, "Today");
         if (today < 1000 && *unit == 'k')
            gfx_text (0, 5, "%.0f%sh", today, unit + 1);
         else
            gfx_text (0, 5, "%.1f%sh", today / 1000, unit);
         gfx_unlock ();
         sleep (60);
      }
#endif
}

void
input_task (void *arg)
{
   arg = arg;
   uint64_t last = 0;
   while (1)
   {
      usleep (1000LL);
      uint64_t this = 0;
      int max = 0;
      for (int i = 0; i < MAXGPIO; i++)
         if (input[i].set)
         {
            if (revk_gpio_get (input[i]))
               this |= (1ULL << i);
            max = i;
         }
      if (this != last || refresh)
      {
         last = this;
         refresh = 0;
         jo_t j = jo_object_alloc ();
         jo_array (j, "input");
         for (int i = 0; i <= max; i++)
            if (input[i].set)
               jo_bool (j, NULL, revk_gpio_get (input[i]));
            else
               jo_null (j, NULL);
         jo_close (j);
         revk_info (NULL, &j);
      }
   }
}

void
output_task (void *arg)
{
   arg = arg;
   while (1)
   {
      usleep (1000);
      for (int i = 0; i < MAXGPIO; i++)
         if (output[i].set && !(outputoverride & (1ULL << i)))
         {
            int p = output[i].num;
            if (outputremaining[i] && !--outputremaining[i])
               outputbits ^= (1ULL << i);       //timeout
            if ((outputbits ^ outputraw) & (1ULL << i))
            {                   //Change output
               outputraw ^= (1ULL << i);
               //REVK_ERR_CHECK(gpio_hold_dis(p));
               REVK_ERR_CHECK (gpio_set_level (p, output[i].invert ^ ((outputbits >> i) & 1)));
               //REVK_ERR_CHECK(gpio_hold_en(p));
               if (outputbits & (1ULL << i))
                  outputremaining[i] = outputmark[i];   //Time
               else if (!outputcount[i] || (outputcount[i] != -1 && !--outputcount[i]))
                  outputremaining[i] = 0;
               else
                  outputremaining[i] = outputspace[i];  //Time
            }
         }
   }
}

const char *
gfx_qr (const char *value)
{
#ifndef	CONFIG_GFX_BUILD_SUFFIX_GFXNONE
   unsigned int width = 0;
 uint8_t *qr = qr_encode (strlen (value), value, widthp: &width, noquiet:1);
   if (!qr)
      return "Failed to encode";
   int w = gfx_width ();
   int h = gfx_height ();
   if (!width || width > w || width > h)
   {
      free (qr);
      return "Too wide";
   }
   gfx_lock ();
   gfx_clear (0);
   int s = (w > h ? h : w) / width;
   ESP_LOGE (TAG, "QR %d/%d %d", w, h, s);
   int ox = (w - width * s) / 2;
   int oy = (h - width * s) / 2;
   for (int y = 0; y < width; y++)
      for (int x = 0; x < width; x++)
         if (qr[width * y + x] & QR_TAG_BLACK)
            for (int dy = 0; dy < s; dy++)
               for (int dx = 0; dx < s; dx++)
                  gfx_pixel (ox + x * s + dx, oy + y * s + dy, 0xFF);
   gfx_pos (1, 1, GFX_T | GFX_L);
   gfx_text (1, "%s", value);
   gfx_unlock ();
   free (qr);
#endif
   return NULL;
}

char *
setdefcon (int level, char *value)
{                               // DEFCON state
   // With value it is used to turn on/off a defcon state, the lowest set dictates the defcon level
   // With no value, this sets the DEFCON state directly instead of using lowest of state set
   static uint8_t state = 0;    // DEFCON state
   if (*value)
   {
      if (*value == '1' || *value == 't' || *value == 'y')
         state |= (1 << level);
      else
         state &= ~(1 << level);
      int l;
      for (l = 0; l < 8 && !(state & (1 << l)); l++);
      defcon_level = l;
   } else
      defcon_level = level;
   return "";
}

const char *
app_callback (int client, const char *prefix, const char *target, const char *suffix, jo_t j)
{
   char value[1000];
   int len = 0;
   *value = 0;
   if (j)
   {
      len = jo_strncpy (j, value, sizeof (value));
      if (len < 0)
         return "Expecting JSON string";
      if (len > sizeof (value))
         return "Too long";
   }
   if (defcon && prefix && !strcmp (prefix, "DEFCON") && target && isdigit ((int) *target) && !target[1])
      return setdefcon (*target - '0', value);
   if (client || !prefix || target || strcmp (prefix, topiccommand) || !suffix)
      return NULL;              //Not for us or not a command from main MQTT
   if (defcon && isdigit ((int) *suffix) && !suffix[1])
      return setdefcon (*suffix - '0', value);
   if (!strcmp (suffix, "tx") && loratx)
   {
      lora_send_packet ((uint8_t *) value, len);
      ESP_LOGE (TAG, "Tx %d (%d lost)", len, lora_packet_lost ());
      return "";
   }
   if (!strcmp (suffix, "connect"))
   {
      if (defcon)
         lwmqtt_subscribe (revk_mqtt (0), "DEFCON/#");
      refresh = 1;
   }
   if (!strcmp (suffix, "shutdown"))
      httpd_stop (webserver);
   if (!strcmp (suffix, "upgrade") || !strcmp (suffix, "wait"))
   {
      busy = esp_timer_get_time () + 60000000ULL;
      return "";
   }
   if (!strcmp (suffix, "sleep"))
   {
      busy = 0;
      return "";
   }
   if (!strcmp (suffix, "qr"))
   {
      return gfx_qr (value) ? : "";
   }
   if (!strcmp (suffix, "message"))
   {
      gfx_message (value);
      return "";
   }
   if (!strncmp (suffix, "output", 6))
   {
      int i = atoi (suffix + 6);
      if (i < 0 || i >= MAXGPIO)
         return "Bad output number";
      if (!output[i].set)
         return "Output not configured";
      int c = atoi (value);
      if (!c && (*value == 't' || *value == 'y'))
         c = 1;
      if (c)
      {
         if (!outputcount[i])
         {                      // On
            outputcount[i] = c;
            outputbits |= (1ULL << i);
         }
      } else
      {                         // Off
         outputcount[i] = 0;
         outputbits &= ~(1ULL << i);
      }
      return "";
   }
   if (!strncmp (suffix, "pwm", 3))
   {
      int i = atoi (suffix + 3);
      if (i < 0 || i >= MAXGPIO)
         return "Bad output number";
      if (!output[i].set)
         return "Output not configured";
      int p = output[i].num;
      int freq = atoi (value);
      if (!freq)
      {
         gpio_reset_pin (p);
         REVK_ERR_CHECK (gpio_set_direction (p, GPIO_MODE_OUTPUT));
         outputcount[i] = 0;
         outputraw |= (1ULL << i);
         outputbits &= ~(1ULL << i);
         outputoverride &= ~(1ULL << i);
         return "";
      }
      outputoverride |= (1ULL << i);
      ledc_timer_config_t t = {
         .duty_resolution = 8,
         .timer_num = i,
         .freq_hz = freq,
      };
      REVK_ERR_CHECK (ledc_timer_config (&t));
      ledc_channel_config_t c = {
         .gpio_num = p,
         .channel = i,
         .timer_sel = i,
         .duty = 128,
      };
      REVK_ERR_CHECK (ledc_channel_config (&c));
      return "";
   }
   return NULL;
}

// --------------------------------------------------------------------------------
// Web
#ifdef	CONFIG_REVK_APCONFIG
#error 	Clash with CONFIG_REVK_APCONFIG set
#endif

void
app_main ()
{
   revk_boot (&app_callback);
   revk_start ();

   // Web interface
   httpd_config_t config = HTTPD_DEFAULT_CONFIG ();
   if (!httpd_start (&webserver, &config))
   {
      {
         httpd_uri_t uri = {
            .uri = "/",
            .method = HTTP_GET,
            .handler = web_root,
            .user_ctx = NULL
         };
         REVK_ERR_CHECK (httpd_register_uri_handler (webserver, &uri));
      }
      {
         httpd_uri_t uri = {
            .uri = "/apple-touch-icon.png",
            .method = HTTP_GET,
            .handler = web_icon,
            .user_ctx = NULL
         };
         REVK_ERR_CHECK (httpd_register_uri_handler (webserver, &uri));
      }
      revk_web_settings_add (webserver);
   }
#ifndef	CONFIG_GFX_BUILD_SUFFIX_GFXNONE
   if (gfxmosi.set || gfxdc.set || gfxsck.set)
   {
    const char *e = gfx_init (cs: gfxcs.num, sck: gfxsck.num, mosi: gfxmosi.num, dc: gfxdc.num, rst: gfxrst.num, busy: gfxbusy.num, ena: gfxena.num, flip: gfxflip, direct:1);
      if (!e)
         e = gfx_qr ("HTTPS://WWW.ME.UK");
      if (e)
      {
         ESP_LOGE (TAG, "gfx %s", e);
         jo_t j = jo_object_alloc ();
         jo_string (j, "error", "Failed to start");
         jo_string (j, "description", e);
         revk_error ("gfx", &j);
      }
   }
#endif
   {
    gpio_config_t o = { mode:GPIO_MODE_OUTPUT };
    gpio_config_t u = { mode: GPIO_MODE_INPUT, pull_up_en:GPIO_PULLUP_ENABLE };
    gpio_config_t d = { mode: GPIO_MODE_INPUT, pull_down_en:GPIO_PULLDOWN_ENABLE };
      for (int i = 0; i < MAXGPIO; i++)
      {
         if (input[i].set)
         {
            int p = input[i].num;
            if (gpio_ok (p) & 2)
            {
               ESP_LOGE (TAG, "Input %d%s", p, input[i].invert ? "¬" : "");
               if (input[i].invert)
                  u.pin_bit_mask |= (1ULL << p);
               else
                  d.pin_bit_mask |= (1ULL << p);
            }
         }
         if (output[i].set)
         {
            int p = output[i].num;
            if (gpio_ok (p) & 1)
            {
               ESP_LOGE (TAG, "Output %d%s", p, output[i].invert ? "¬" : "");
               o.pin_bit_mask |= (1ULL << p);
               REVK_ERR_CHECK (gpio_set_level (p, output[i].invert));
               holding++;
            }
         }
         if (power[i].set)
         {
            int p = power[i].num;
            if (gpio_ok (p) & 1)
            {
               ESP_LOGE (TAG, "Power %d%s", p, power[i].invert ? "-" : "+");
               o.pin_bit_mask |= (1ULL << p);
               //REVK_ERR_CHECK(gpio_hold_dis(p));
               REVK_ERR_CHECK (gpio_set_level (p, power[i].invert));
               //REVK_ERR_CHECK (gpio_set_drive_capability (p, GPIO_DRIVE_CAP_3));
               holding++;
            }
         }
      }
      if (o.pin_bit_mask)
         REVK_ERR_CHECK (gpio_config (&o));
      if (u.pin_bit_mask)
         REVK_ERR_CHECK (gpio_config (&u));
      if (d.pin_bit_mask)
         REVK_ERR_CHECK (gpio_config (&d));
   }
   if (esp_reset_reason () != ESP_RST_DEEPSLEEP && awake < 60)
      awake = 60;
   if (usb.set)
   {
      revk_gpio_input (usb);
      usleep (1000);
      if (revk_gpio_get (usb))
      {
         ESP_LOGI (TAG, "USB found");
         usb_present = 1;
         if (awake < 60)
            awake = 60;
      } else if (period)
      {                         // TODO ???
         esp_log_level_set ("*", ESP_LOG_NONE); /* no debug */
         //gpio_reset_pin (1);
         //gpio_set_pull_mode (1, GPIO_PULLDOWN_ONLY);
      }
   }
   if (charger.set)
   {
      revk_gpio_input (charger);
      usleep (1000);
      if (revk_gpio_get (charger))
      {
         ESP_LOGI (TAG, "Charger found");
         charger_present = 1;
         if (period)
         {                      // TODO ??
            esp_log_level_set ("*", ESP_LOG_NONE);      /* no debug */
            //gpio_reset_pin (1);
            //gpio_set_pull_mode (1, GPIO_PULLDOWN_ONLY);
         }
         busy = 0;
         //No point waiting, powered via USB port
      }
   }
#if 0
   if (adcon)
   {
      revk_gpio_output (adcon, 1);
      esp_adc_cal_characteristics_t adc_chars = { 0 };
      esp_adc_cal_characterize (ADC_UNIT_1, ADC_ATTEN_DB_11, ADC_WIDTH_BIT_12, 1100, &adc_chars);
      REVK_ERR_CHECK (adc1_config_width (ADC_WIDTH_BIT_12));
      REVK_ERR_CHECK (adc1_config_channel_atten (adc, ADC_ATTEN_DB_11));
#define TRIES 100
      voltage = 0;
      for (int try = 0; try < TRIES; try++)
      {
         uint32_t v = 0;
         REVK_ERR_CHECK (esp_adc_cal_get_voltage (adc, &adc_chars, &v));
         if (adcr2)
            v = v * (adcr1 + adcr2) / adcr2;
         voltage += v;
      }
      voltage /= TRIES;
      if (!usb_present)
         revk_gpio_set (adcon, 0);
   }
#endif
   if (rangergnd.set)
      revk_gpio_output (rangergnd, 1);
   if (rangerpwr.set)
      revk_gpio_output (rangerpwr, 1);
   if (rangersda.set && rangerscl.set)
   {
      ESP_LOGI (TAG, "Ranger init GND=%d PWR=%d SCL=%d SDA=%d Address=%02X", rangergnd.num, rangerpwr.num,
                rangerscl.num, rangersda.num, rangeraddress & 0x7F);
      if (ranger0x)
      {
         vl53l0x_t *v = vl53l0x_config (0, rangerscl.num, rangersda.num, -1, rangeraddress & 0x7F, 0);
         if (!v)
            ESP_LOGE (TAG, "Ranger config failed");
         else
         {
            rangererr = vl53l0x_init (v);
            if (rangererr)
               ESP_LOGE (TAG, "Ranger error:%s", rangererr);
            else
            {
               range = vl53l0x_readRangeSingleMillimeters (v);
               ESP_LOGI (TAG, "Range=%d", range);
            }
         }
      } else
      {                         /* Try 1X */
         vl53l1x_t *v = vl53l1x_config (0, rangerscl.num, rangersda.num, -1, rangeraddress & 0x7F, 0);
         if (!v)
            ESP_LOGE (TAG, "Ranger config failed");
         else
         {
            rangererr = vl53l1x_init (v);
            if (rangererr)
               ESP_LOGE (TAG, "Ranger error:%s", rangererr);
            else
            {
               range = vl53l1x_readSingle (v, true);
               ESP_LOGI (TAG, "Range=%d", range);
            }
         }
      }
   }
   revk_task ("input", input_task, NULL, 4);
   revk_task ("output", output_task, NULL, 4);
   if (defcon)
      revk_task ("defcon", defcon_task, NULL, 4);
   if (ds18b20.set)
      revk_task ("ds18b20", ds18b20_task, NULL, 4);
   if (!revk_wait_wifi (10))
   {
      ESP_LOGE (TAG, "No WiFi");
      if (awake < 60)
         awake = 60;
   } else if (!revk_wait_mqtt (2))
      ESP_LOGE (TAG, "No MQTT");
   else
   {
      time_t now = time (0);
      if (now < 30)
      {                         /* wait clock set */
         ESP_LOGI (TAG, "Wait clock set");
         while ((now = time (0)) < 30)
            sleep (1);
      }
      int64_t run = esp_timer_get_time ();
      struct tm tm;
      gmtime_r (&now, &tm);
      if (!tm.tm_hour && !tm.tm_min && awake < 10)
         awake = 10;            /* allow clock to set */
      jo_t j = jo_object_alloc ();
      jo_string (j, "id", revk_id);
      jo_stringf (j, "ts", "%04d-%02d-%02dT%02d:%02d:%02dZ", tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday,
                  tm.tm_hour, tm.tm_min, tm.tm_sec);
      jo_litf (j, "runtime", "%u.%06u", (int) run / 1000000, (int) run % 1000000);
      if (range)
         jo_litf (j, "range", "%d", range);
      if (voltage)
         jo_litf (j, "voltage", "%u.%03u", voltage / 1000, voltage % 1000);
      if (charger_present)
         jo_bool (j, "charger", 1);
      else if (usb_present)
         jo_bool (j, "usb", 1);
      revk_info (NULL, &j);
   }

   if (uart1rx.set)
      revk_task ("uart1", uart_task, &uart1rx, 4);
   if (uart2rx.set)
      revk_task ("uart2", uart_task, &uart2rx, 4);
   if (*sekey && sesite)
      revk_task ("solaredge", se_task, NULL, 4);
   if (scl.set && sda.set)
   {
      esp_err_t err;
      err = i2c_driver_install (i2c, I2C_MODE_MASTER, 0, 0, 0);
      if (!err)
      {
         i2c_config_t config = {
            .mode = I2C_MODE_MASTER,
            .sda_io_num = sda.num,
            .scl_io_num = scl.num,
            .sda_pullup_en = true,
            .scl_pullup_en = true,
            .master.clk_speed = 400000,
         };
         err = i2c_param_config (i2c, &config);
         if (err)
            i2c_driver_delete (i2c);
      }
      if (err)
      {
         jo_t j = jo_object_alloc ();
         jo_string (j, "error", "Failed to start I2C");
         jo_string (j, "description", esp_err_to_name (err));
         revk_error ("i2c", &j);
         scl.set = sda.set = 0;
      }
   }
   if (scl.set && sda.set && als)
      revk_task ("als", als_task, NULL, 4);
   if (lorarest.set)
   {
      if (lora_start () && !loratx)
         revk_task ("lora", lora_rx_task, NULL, 4);
   }
   if (!period)
   {
      //We run forever, not sleeping
      ESP_LOGE (TAG, "Idle");
#if 0
      REVK_ERR_CHECK (esp_now_init ());
      esp_now_peer_info_t peer = {
         .peer_addr = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF},
         .ifidx = WIFI_IF_STA,
      };
      REVK_ERR_CHECK (esp_now_add_peer (&peer));
      static volatile int c = 0;
      void cb (const esp_now_recv_info_t * esp_now_info, const uint8_t * data, int data_len)
      {
         c = 2;
      }
      REVK_ERR_CHECK (esp_now_register_recv_cb (&cb));
      while (1)
      {
         time_t now = time (0);
         REVK_ERR_CHECK (esp_now_send (peer.peer_addr, (void *) &now, sizeof (now)));
         sleep (1);
         if (c)
            c--;
         revk_blink (0, 0, c ? "G" : "R");
      }
#else
      while (1)
      {
#ifndef	CONFIG_GFX_BUILD_SUFFIX_GFXNONE
         if (gfxmosi.set || gfxdc.set || gfxsck.set)
         {
            char temp[100];
            time_t now = time (0);
            struct tm t;
            localtime_r (&now, &t);
            gfx_lock ();
            gfx_clear (0);
            gfx_pos (gfx_width () / 2, gfx_height () / 2, GFX_B | GFX_C | GFX_V);
            gfx_text (6, "%lu", now);
            strftime (temp, sizeof (temp), "%T", &t);
            gfx_text (6, "%s", temp);
            strftime (temp, sizeof (temp), "%F", &t);
            gfx_text (6, "%s", temp);
            gfx_unlock ();
            sleep (10 - (t.tm_sec % 10));
         } else
#endif
            sleep (1);
      }
#endif
      return;
   }
   // Sleepy stuff
   if (!busy)
   {
      ESP_LOGI (TAG, "Wait for %ld", awake);    /* wait a bit */
      if (awake)
         sleep (awake);
      else
         usleep (50000);        /* just long enough ? */
   }
   if (busy)
   {
      ESP_LOGI (TAG, "Waiting %d", (int) ((busy - esp_timer_get_time ()) / 1000000ULL));
      while (busy > esp_timer_get_time ())
         sleep (1);
   }
   time_t next = (time (0) + 5) / period * period + period;
   {
      char reason[100];
      struct tm tm;
      gmtime_r (&next, &tm);
      sprintf (reason, "Sleep after %lldms until %04d-%02d-%02dT%02d:%02d:%02dZ",
               esp_timer_get_time () / 1000, tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday, tm.tm_hour, tm.tm_min, tm.tm_sec);
      revk_mqtt_close (reason);
      revk_wifi_close ();
      if (holding)
         gpio_deep_sleep_hold_en ();
      else
         gpio_deep_sleep_hold_dis ();
      esp_sleep_config_gpio_isolate ();
      ESP_LOGI (TAG, "%s", reason);
   }
   if (usb_present && !charger_present)
      sleep (1);
   struct timeval tv;
   gettimeofday (&tv, NULL);
   if (next < tv.tv_sec + 1)
      next = tv.tv_sec + 1;
   esp_deep_sleep (((uint64_t) next - tv.tv_sec - 1) * 1000000LL + 1000000LL - tv.tv_usec);
   /* Should not get here */
   ESP_LOGE (TAG, "Still awake!");
   while (1)
      sleep (1);
}
