// OTA app, can be used to do an OTA from a small footprint. Also does partition update.
// Warning, moving NVS will typically mess reset all of the settings
// Copyright © 2019 Adrian Kennard, Andrews & Arnold Ltd. See LICENCE file for details. GPL 3.0
static const char TAG[] = "OTA";

#include "revk.h"
#include <esp_spi_flash.h>

static char *otaurl;

const char *
app_command (const char *tag, unsigned int len, const unsigned char *value)
{
   if (!strcmp (tag, "wifi") && *otaurl)
   {
      revk_ota (otaurl);
      revk_setting ("otaurl", 0, NULL); // Clear the URL
   }
   if (!strcmp (tag, "connect"))
      revk_info (TAG, "Running generic OTA system");
   return "";
}

void
app_main ()
{
   revk_init (&app_command);
   revk_register ("otaurl", 0, 0, &otaurl, NULL, 0);
   // Note, this used to do partition checks, but now done in revk library
}
