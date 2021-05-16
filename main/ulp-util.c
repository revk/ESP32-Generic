#include "ulp-util.h"
#include "esp32/ulp.h"

#ifndef CONFIG_ESP32_ULP_COPROC_ENABLED
#error Set CONFIG_ESP32_ULP_COPROC_ENABLED
#endif

extern const uint8_t _ulp_start[] asm("_binary_ulp_main_bin_start");
extern const uint8_t _ulp_end[]   asm("_binary_ulp_main_bin_end");

void ulp_init() {
  ESP_ERROR_CHECK( ulp_load_binary(0, _ulp_start, (_ulp_end-_ulp_start)/sizeof(ulp_entry)) );
}

void ulp_start() {
  ESP_ERROR_CHECK( ulp_run(&ulp_entry-RTC_SLOW_MEM) );
}

