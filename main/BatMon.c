/* BatMon app */
/* Copyright ©2019 - 21 Adrian Kennard, Andrews & Arnold Ltd.See LICENCE file for details .GPL 3.0 */

static const char TAG[] = "BatMon";

#include "revk.h"
#include "esp_sleep.h"
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

uint64_t busy = 0;

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
   char            usb = 0;
   if (cbus)
   {
      gpio_reset_pin(cbus & 0x3F);
      gpio_set_pull_mode(cbus & 0x3F, GPIO_PULLDOWN_ONLY);
      usleep(1000);
      if (gpio_get_level(cbus & 0x3F) == ((cbus & 0x40) ? 0 : 1))
         usb = 1;
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
   struct timeval  tv;
   gettimeofday(&tv, NULL);
   uint64_t t=((period - 1) - (tv.tv_sec % period)) * 1000000ULL + 1000000ULL - tv.tv_usec;
   revk_mqtt_close("Sleep");
   esp_wifi_stop();
   esp_sleep_config_gpio_isolate();
   esp_deep_sleep(t);

   /* Should not get here */
   ESP_LOGE(TAG, "Awake");
   while (1)
      sleep(1);
}
