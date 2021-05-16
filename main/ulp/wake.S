#include "soc/rtc_cntl_reg.h"
#include "soc/soc_ulp.h"
#include "soc/rtc_io_reg.h"

    .data

    	.global time
time:	.long 1

    .text
	.global entry

entry:
	move r1,time
	ld r1,r1,0
	move r1,10000
	move r2,end
loop:
	wait  8000        // 1ms
	sub r1,r1,1
	jump r2,eq
	jump loop
end:
	wake
done:
	jump done


