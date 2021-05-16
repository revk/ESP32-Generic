// BatMon app
// Copyright © 2019-21 Adrian Kennard, Andrews & Arnold Ltd. See LICENCE file for details. GPL 3.0
static const char TAG[] = "BatMon";

#include "revk.h"
#include "esp_sleep.h"     // esp_sleep_enable_ulp_wakeup(), esp_deep_sleep_start()
#include "ulp-util.h"

const char *app_command(const char *tag, unsigned int len, const unsigned char *value)
{
   if (!strcmp(tag, "connect"))
      revk_info(TAG, "Running generic BatMon system");
   return "";
}

void app_main()
{
   revk_init(&app_command);
   sleep(60);
   ulp_init();
   ulp_start();

   esp_sleep_enable_ulp_wakeup();
   esp_deep_sleep_start();
}
