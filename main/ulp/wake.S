#include "soc/rtc_cntl_reg.h"
#include "soc/soc_ulp.h"
#include "soc/rtc_io_reg.h"

	.global entry
	.global	time

	.data
time:
	.long 10000

    	.text
entry:
	move r1,time
	ld r1,r1,0
	move r2,done

loop:
	wait 7980 // one second less time to loop
	sub r1,r1,1
	jump r2,eq
	jump loop

done:
	wake
	halt


