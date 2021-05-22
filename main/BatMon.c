/* BatMon app */
/* Copyright ©2019 - 21 Adrian Kennard, Andrews & Arnold Ltd.See LICENCE file for details .GPL 3.0 */

static const char TAG[] = "BatMon";

#include "revk.h"
#include "esp_sleep.h"          // esp_sleep_enable_ulp_wakeup(), esp_deep_sleep_start()
#include "esp32/ulp.h"
#include "ulp-main.h"
#include <driver/gpio.h>

#define	settings		\
	u32(period,60)	\
	u32(awake,1)	\
	io(cbus)	\
	io(led)	\

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
#ifndef CONFIG_ESP32_ULP_COPROC_ENABLED
#error Set CONFIG_ESP32_ULP_COPROC_ENABLED
#endif
extern const uint8_t _ulp_start[] asm("_binary_ulp_main_bin_start");
extern const uint8_t _ulp_end[] asm("_binary_ulp_main_bin_end");

void
ulp_init()
{
   ESP_ERROR_CHECK(ulp_load_binary(0, _ulp_start, (_ulp_end - _ulp_start) / sizeof(ulp_entry)));
}

void
ulp_start()
{
   ESP_ERROR_CHECK(ulp_run(&ulp_entry - RTC_SLOW_MEM));
}

uint64_t        busy = 0;

const char     *
app_command(const char *tag, unsigned int len, const unsigned char *value)
{
   ESP_LOGE(TAG, "%s", tag);
   if (!strcmp(tag, "upgrade") || !strcmp(tag, "wait"))
   {
      busy = esp_timer_get_time() + 60000000ULL;
      return "";
   }
   return NULL;
}

void
app_main()
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
      ESP_LOGE(TAG, "Start %ld", time(0) % period);
   for (int port = 39; port >= 0; port--)
      if (GPIO_IS_VALID_GPIO(port) && (port < 6 || port > 11))
      {                         /* TODO check if USB connected first */
         gpio_reset_pin(port);
         gpio_set_pull_mode(port, GPIO_FLOATING);
      }
   if (led)
   {
      gpio_set_direction(led & 0x3F, GPIO_MODE_OUTPUT);
      gpio_set_level(led & 0x3F, (led & 0x40) ? 0 : 1); /* on */
   }
   if (!period)
      period = 60;              /* avoid divide by zero */
   for (int t = 100; t; t--)
      if (revk_offline())
         usleep(100000);
      else
         break;
   if (time(0) < 10)
   {                            /* wait clock set */
      ESP_LOGE(TAG, "Wait clock set");
      while (time(0) < 10)
         sleep(1);
   }
   ESP_LOGE(TAG, "Online for %d", awake);
   /* wait a bit */
   sleep(awake);
   if (busy)
   {
      ESP_LOGE(TAG, "Waiting");
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
   ESP_LOGE(TAG, "Sleeping");
   revk_mqtt_close("Sleep");
   ulp_init();
   ulp_time = period - (time(0) % period);
   ESP_LOGE(TAG, "Going to sleep %ds", ulp_time);
   esp_sleep_enable_ulp_wakeup();
   ulp_start();
   ESP_LOGE(TAG, "Deep sleep");
   esp_deep_sleep_start();
   //Should not get here
      ESP_LOGE(TAG, "Awake");
   while (1)
      sleep(1);
}
