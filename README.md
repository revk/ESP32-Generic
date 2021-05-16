# Simplest code and PCB for ESP32 projects

The code is the simplest build from RevK library, and as such is an ideal base install from which you can OTA any other code. Can also be used as a staged OTA using "otaurl" in the "OTA" namespace in NVS as an automatic OTA when started.

There are also two PCB designs:-

# Generic

A small 29mm x 19mm board for ESP32-WROOM-32 and 6 pin connector (SPOX or 0.1" pins). Provides 5 GPIO (all are ADC, TOUCH, and RTC). Power (and serial) via USB-C, or can use DC input (either via 6 way header or separate pads) 4V to 40V. The 6 way header includes pads for various passives to be fitted. Includes one on-board LED.

# Battery

A slightly more complex design in the same size as above, but the USB is separately powered. When no USB connected it draws no current. The regulator has an automatic ECO mode down to 27uA. Ideal for ULP based projects running from battery (4V to 40V, so ideal for 9V battery).

Copyright © 2019-21 Adrian Kennard, Andrews & Arnold Ltd. See LICENCE file for details. GPL 3.0
# ESP32-BatMon
