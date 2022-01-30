# ESP32-Generic

Software and hardware for generic ESP32 usage. Software based on ESP32-RevK library.

# Hardware

Various KiCad designs, with 3D printed case designs.

- All feature USB-C connection for power and also debug/serial.
- All allow external DC supply 4V to 60V.
- All feature an RGB LED

## ESP32-Generic

Small PCB with 6 pin connector (5 GPIO+GND) - can use SPOX 2.5mm or 0.1" header.

![Generic](https://user-images.githubusercontent.com/996983/151692417-bf97f5b4-017b-4074-9edc-952c1f0526cb.png)

## ESP32-Generic2

Small PCB with 16 pins (2x8) which are all connected to GPIO but default pin 1 linked to GND (can be cut).

![Generic2a](https://user-images.githubusercontent.com/996983/151692421-359f2ba7-d9bb-447f-9a19-a2da2b949f7f.png)

## ESP32-LowPower

Same as ESP32-Generic but with power control - FET switched potential divide for ADC reading battery supply.

## ESP32-USBA

Simple PCB designed for direct plug in to USB-A socket

![USBA](https://user-images.githubusercontent.com/996983/140615566-fc0d410a-a81b-4b3e-9b71-35afe68315ae.png)

Copyright © 2019-22 Adrian Kennard, Andrews & Arnold Ltd. See LICENCE file for details. GPL 3.0
