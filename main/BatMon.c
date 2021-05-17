// BatMon app
// Copyright © 2019-21 Adrian Kennard, Andrews & Arnold Ltd. See LICENCE file for details. GPL 3.0
static const char TAG[] = "BatMon";

#include "revk.h"
#include "esp_sleep.h"          // esp_sleep_enable_ulp_wakeup(), esp_deep_sleep_start()
#include "esp32/ulp.h"
#include "ulp-main.h"

#define	settings		\
	u32(period,60)	\
	u32(awake,1)	\

#define u32(n,d)        uint32_t n;
#define s8(n,d) int8_t n;
#define u8(n,d) uint8_t n;
#define b(n) uint8_t n;
#define s(n) char * n;
settings
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

void ulp_init()
{
   ESP_ERROR_CHECK(ulp_load_binary(0, _ulp_start, (_ulp_end - _ulp_start) / sizeof(ulp_entry)));
}

void ulp_start()
{
   ESP_ERROR_CHECK(ulp_run(&ulp_entry - RTC_SLOW_MEM));
}

uint8_t busy = 0;               // Don't sleep

const char *app_command(const char *tag, unsigned int len, const unsigned char *value)
{
   ESP_LOGE(TAG, "%s", tag);
   if (!strcmp(tag, "upgrade"))
      busy = 1;
   return "";
}

void app_main()
{
   revk_init(&app_command);
#define b(n) revk_register(#n,0,sizeof(n),&n,NULL,SETTING_BOOLEAN);
#define u32(n,d) revk_register(#n,0,sizeof(n),&n,#d,0);
#define s8(n,d) revk_register(#n,0,sizeof(n),&n,#d,SETTING_SIGNED);
#define u8(n,d) revk_register(#n,0,sizeof(n),&n,#d,0);
#define s(n) revk_register(#n,0,0,&n,NULL,0);
   settings
#undef u32
#undef s8
#undef u8
#undef b
#undef s
       if (!period)
      period = 60;              // Avoid divide by zero
   ESP_LOGE(TAG, "Start %ld", time(0) % period);
   for (int t = 100; t; t--)
      if (revk_offline())
         usleep(100000);
      else
         break;
   ESP_LOGE(TAG, "Online %lld", esp_timer_get_time());
   while (time(0) < 10)
      sleep(1);                 // Wait clock set
   // Do some stuff...
   // Now to sleep
   sleep(awake);
   if (busy)
   {
      ESP_LOGE(TAG, "Waiting");
      while (1)
         sleep(1);
   }
   ESP_LOGE(TAG, "Sleeping");
   revk_mqtt_close("Sleep");
   ulp_init();
   struct timeval tv;
   struct timezone tz;
   gettimeofday(&tv, &tz);
   ulp_time = 1000 * ((period - 1) - (tv.tv_sec % period)) + (1000 - tv.tv_usec / 1000);
   ESP_LOGE(TAG, "Going to sleep %dms", ulp_time);
   esp_sleep_enable_ulp_wakeup();
   ulp_start();
   ESP_LOGE(TAG, "Deep sleep");
   esp_deep_sleep_start();
   // Should not get here
   ESP_LOGE(TAG, "Awake");
   while (1)
      sleep(1);
}
