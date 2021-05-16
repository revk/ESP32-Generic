// BatMon app
// Copyright © 2019-21 Adrian Kennard, Andrews & Arnold Ltd. See LICENCE file for details. GPL 3.0
static const char TAG[] = "BatMon";

#include "revk.h"
#include "esp_sleep.h"          // esp_sleep_enable_ulp_wakeup(), esp_deep_sleep_start()
#include "ulp-util.h"
#include "wake.h"

uint8_t busy = 0;               // Don't sleep

const char *app_command(const char *tag, unsigned int len, const unsigned char *value)
{
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
   // Do some stuff...
   // Now to sleep
   sleep(10);
   if (busy)
      return;
   revk_mqtt_close();
   usleep(10000);
   time_t now = time(0);
   //ulp_time = 1000 * (60 - (now % 60));;
   ESP_LOGE(TAG, "Going to sleep %dms", ulp_time);
   ulp_init();
   ulp_start();
   esp_sleep_enable_ulp_wakeup();
   esp_deep_sleep_start();
   ESP_LOGE(TAG, "awake");
}
