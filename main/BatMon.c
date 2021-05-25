/* BatMon app */
/* Copyright ©2019 - 21 Adrian Kennard, Andrews & Arnold Ltd.See LICENCE file for details .GPL 3.0 */

static const char TAG[] = "BatMon";

#include "revk.h"
#include "esp_sleep.h"
#include "esp_task_wdt.h"
#include "vl53l0x.h"
#include <driver/gpio.h>
#include <driver/uart.h>

#define	settings		\
	u32(period,36000)	\
	u32(awake,0)	\
	io(usb)	\
	io(charger)	\
	io(led)	\
	io(rangergnd)	\
	io(rangerpwr)	\
	io(rangerscl)	\
	io(rangersda)	\
        u8(rangeraddress,0x29)  \

#define u32(n,d)        uint32_t n;
#define s8(n,d) int8_t n;
#define u8(n,d) uint8_t n;
#define b(n) uint8_t n;
#define s(n) char * n;
#define io(n)           uint8_t n;
settings
#undef io
#undef u32
#undef s8
#undef u8
#undef b
#undef s
    uint64_t busy = 0;
char usb_present = 0;
char charger_present = 0;
const char *rangererr = NULL;
uint16_t range = 0;
vl53l0x_t *v = NULL;

const char *app_command(const char *tag, unsigned int len, const unsigned char *value)
{
   if (!strcmp(tag, "upgrade") || !strcmp(tag, "wait"))
   {
      busy = esp_timer_get_time() + 60000000ULL;
      return "";
   }
   if (!strcmp(tag, "sleep"))
   {
      busy = 0;
      return "";
   }
   return NULL;
}

void app_main()
{
   revk_init(&app_command);
#define io(n)           revk_register(#n,0,sizeof(n),&n,"-",SETTING_SET|SETTING_BITFIELD);
#define b(n) revk_register(#n,0,sizeof(n),&n,NULL,SETTING_BOOLEAN);
#define u32(n,d) revk_register(#n,0,sizeof(n),&n,#d,0);
#define s8(n,d) revk_register(#n,0,sizeof(n),&n,#d,SETTING_SIGNED);
#define u8(n,d) revk_register(#n,0,sizeof(n),&n,#d,0);
#define s(n) revk_register(#n,0,0,&n,NULL,0);
   settings
#undef io
#undef u32
#undef s8
#undef u8
#undef b
#undef s
       if (!period)
      period = 60;              /* avoid divide by zero */
   ESP_LOGI(TAG, "Start %ld", time(0) % period);
   if (usb)
   {
      gpio_reset_pin(usb & 0x3F);
      gpio_set_pull_mode(usb & 0x3F, GPIO_PULLDOWN_ONLY);
      gpio_set_direction(usb & 0x3F, GPIO_MODE_INPUT);
      usleep(1000);
      if (gpio_get_level(usb & 0x3F) == ((usb & 0x40) ? 0 : 1))
      {
         gpio_set_pull_mode(usb & 0x3F, GPIO_PULLUP_ONLY);
         ESP_LOGI(TAG, "USB found");
         usb_present = 1;
         busy = esp_timer_get_time() + 300000000ULL;
      } else
      {
         esp_log_level_set("*", ESP_LOG_NONE);  /* no debug */
         gpio_reset_pin(1);
         gpio_set_pull_mode(1, GPIO_PULLDOWN_ONLY);
      }
   }
   if (charger)
   {
      gpio_reset_pin(charger & 0x3F);
      gpio_set_pull_mode(charger & 0x3F, GPIO_PULLDOWN_ONLY);
      gpio_set_direction(charger & 0x3F, GPIO_MODE_INPUT);
      usleep(1000);
      if (gpio_get_level(charger & 0x3F) == ((charger & 0x40) ? 0 : 1))
      {
         gpio_set_pull_mode(charger & 0x3F, GPIO_PULLUP_ONLY);
         ESP_LOGI(TAG, "Charger found");
         charger_present = 1;
         esp_log_level_set("*", ESP_LOG_NONE);  /* no debug */
         gpio_reset_pin(1);
         gpio_set_pull_mode(1, GPIO_PULLDOWN_ONLY);
         busy = 0;              // No point waiting, powered via USB port
      }
   }
   if (led)
   {
      gpio_reset_pin(led & 0x3F);
      gpio_set_level(led & 0x3F, (led & 0x40) ? 0 : 1); /* on */
      gpio_set_direction(led & 0x3F, GPIO_MODE_OUTPUT);
   }
   if (rangergnd)
   {
      gpio_reset_pin(rangergnd & 0x3F);
      gpio_set_level(rangergnd & 0x3F, (rangergnd & 0x40) ? 1 : 0);     /* gnd */
      gpio_set_direction(rangergnd & 0x3F, GPIO_MODE_OUTPUT);
   }
   if (rangerpwr)
   {
      gpio_reset_pin(rangerpwr & 0x3F);
      gpio_set_level(rangerpwr & 0x3F, (rangerpwr & 0x40) ? 0 : 1);     /* pwr */
      gpio_set_direction(rangerpwr & 0x3F, GPIO_MODE_OUTPUT);
   }
   if (rangersda && rangerscl)
   {
      ESP_LOGI(TAG, "Ranger init GND=%d PWR=%d SCL=%d SDA=%d Address=%02X", rangergnd & 0x3F, rangerpwr & 0x3F, rangerscl & 0x3F, rangersda & 0x3F, rangeraddress);
      vl53l0x_t *v = vl53l0x_config(0, rangerscl & 0x3F, rangersda & 0x3F, -1, rangeraddress, 0);
      if (!v)
         ESP_LOGE(TAG, "Ranger config failed");
      else
      {
         rangererr = vl53l0x_init(v);
         if (rangererr)
            ESP_LOGE(TAG, "Ranger error:%s", rangererr);
         else
         {
            range = vl53l0x_readRangeSingleMillimeters(v);
            ESP_LOGI(TAG, "Range=%d", range);
         }
      }
   }
   if (!revk_wait_wifi(10))
   {
      ESP_LOGE(TAG, "No WiFi");
      busy = esp_timer_get_time() + 300000000ULL;
   } else if (!revk_wait_mqtt(2))
      ESP_LOGE(TAG, "No MQTT");
   else
   {
      if (time(0) < 30)
      {                         /* wait clock set */
         ESP_LOGI(TAG, "Wait clock set");
         while (time(0) < 30)
            sleep(1);
      }
      struct tm tm;
      time_t now = time(0);
      gmtime_r(&now, &tm);
      char temp[200],
      *p = temp,
          *e = temp + sizeof(temp) - 1;
      p += snprintf(p, (int) (e - p), "{\"id\":\"%s\"", revk_id);
      p += snprintf(p, (int) (e - p), ",\"ts\":\"%04d-%02d-%02dT%02d:%02d:%02dZ\"", tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday, tm.tm_hour, tm.tm_min, tm.tm_sec);
      if (range)
         p += snprintf(p, (int) (e - p), ",\"range\":%d", range);
      if (charger_present)
         p += snprintf(p, (int) (e - p), ",\"charger\":true");
      else if (usb_present)
         p += snprintf(p, (int) (e - p), ",\"usb\":true");
      /* TODO bat level */
      p += snprintf(p, (int) (e - p), "}");
      ESP_LOGI(TAG, "%s", temp);
      revk_info(NULL, "%s", temp);
   }
   if (!busy)
   {
      ESP_LOGI(TAG, "Wait for %d", awake);      /* wait a bit */
      if (awake)
         sleep(awake);
      else
         usleep(50000);         /* just long enough ? */
   }
   if (busy)
   {
      revk_info(TAG, "Waiting %d", (int) ((busy - esp_timer_get_time()) / 1000000ULL));
      ESP_LOGI(TAG, "Waiting %d", (int) ((busy - esp_timer_get_time()) / 1000000ULL));
      while (busy > esp_timer_get_time())
      {
         if (led)
            gpio_set_level(led & 0x3F, (led & 0x40) ? 0 : 1);   /* on */
         usleep(500000);
         if (led)
            gpio_set_level(led & 0x3F, (led & 0x40) ? 1 : 0);   /* Off */
         usleep(500000);
      }
   }
   if (led)
      gpio_set_level(led & 0x3F, (led & 0x40) ? 1 : 0); /* Off */
   time_t next = (time(0) + 5) / period * period + period;
   {
      char reason[100];
      struct tm tm;
      gmtime_r(&next, &tm);
      sprintf(reason, "Sleep after %lldms until %04d-%02d-%02dT%02d:%02d:%02dZ", esp_timer_get_time() / 1000, tm.tm_year + 1900, tm.tm_mon + 1, tm.tm_mday, tm.tm_hour, tm.tm_min, tm.tm_sec);
      revk_mqtt_close(reason);
      revk_wifi_close();
      esp_sleep_config_gpio_isolate();
      ESP_LOGI(TAG, "%s", reason);
   }
   if (usb_present && !charger_present)
      sleep(1);
   struct timeval tv;
   gettimeofday(&tv, NULL);
   if (next < tv.tv_sec + 1)
      next = tv.tv_sec + 1;
   esp_deep_sleep(((uint64_t) next - tv.tv_sec - 1) * 1000000LL + 1000000LL - tv.tv_usec);

   /* Should not get here */
   ESP_LOGE(TAG, "Still awake!");
   while (1)
      sleep(1);
}
