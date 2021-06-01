# ESP32-BatMon

Simple battery based monitoring app with PCB deisgn.

This PCB design has a 6 pin connector (SPOX or 0.1" header) for 5 GPIO pins, USB-C for power and debug/serial, ADC connection to DC supply via potential divide and switched via a FET for low power working, LED. Can be powered by DC contacts or via 6 pin connector (4V-40V) or via USB. Works with esptool for flashing and debug via USB. GPIO pins with optional pull up or similar components.

![Battery](https://user-images.githubusercontent.com/996983/119488601-a9e11300-bd52-11eb-8f39-9f28214a056b.png)

Copyright © 2019-21 Adrian Kennard, Andrews & Arnold Ltd. See LICENCE file for details. GPL 3.0
