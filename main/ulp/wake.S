#include "soc/rtc_cntl_reg.h"
#include "soc/soc_ulp.h"
#include "soc/rtc_io_reg.h"

    .bss

    .text
	.global entry

entry:
	wait 1000
end:
	wake
done:
	jump done


