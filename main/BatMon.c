// BatMon app
// Copyright © 2019-21 Adrian Kennard, Andrews & Arnold Ltd. See LICENCE file for details. GPL 3.0
static const char TAG[] = "BatMon";

#include "revk.h"
#include "esp_sleep.h"          // esp_sleep_enable_ulp_wakeup(), esp_deep_sleep_start()
#include "esp32/ulp.h"
#include "ulp-main.h"

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
   ESP_LOGE(TAG, "Start");
   revk_init(&app_command);
   for (int t = 100; t; t--)
      if (revk_offline())
         usleep(100000);
      else
         break;
   ESP_LOGE(TAG, "Online");
   while (time(0) < 10)
      sleep(1);                 // Wait clock set
   // Do some stuff...
   // Now to sleep
   sleep(1);
   if (busy)
   {
      ESP_LOGE(TAG, "Waiting");
      while (1)
         sleep(1);
   }
   ESP_LOGE(TAG, "Sleeping");
   revk_mqtt_close("Sleep");
   ulp_init();
   time_t now = time(0);
   ulp_time = 1000 * (60 - (now % 60)); // After init else overwrites
   ESP_LOGE(TAG, "Going to sleep %dms now=%ld", ulp_time, now);
   esp_sleep_enable_ulp_wakeup();
   ulp_start();
   ESP_LOGE(TAG, "Deep sleep");
   esp_deep_sleep_start();
   // Should not get here
   ESP_LOGE(TAG, "Awake");
   while (1)
      sleep(1);
}
