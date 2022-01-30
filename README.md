# ESP32-Generic

Software and hardware for generic ESP32 usage. Software based on ESP32-RevK library.

# Hardware

Various KiCad designs, with 3D printed case designs.

- USB-C connection for power and also debug/serial.
- Alternative external DC supply 4V to 60V (safe to connect at same time as USB-C)
- On board RGB LED.

## ESP32-Generic

- Very small size (29mm x 19mm PCB, plus antenna on ESP32)
- 6 pin connector (SPOX 2.5mm or 0.1"), which are GND and 5xGPIO
- Pads to allow linking one pin to DC supply (and not linking to GPIO)
- Pads to allow linking other pins to 3.3V, e.g. pull ups, or to power somethign external
- Pad to allow linking one pin to GND, e.g. capacitor

![Generic](https://user-images.githubusercontent.com/996983/151692417-bf97f5b4-017b-4074-9edc-952c1f0526cb.png)

## ESP32-Generic2

- Larger PCB (35.5mm x 22.5mm)
- Two 8 pin connectors (SPOX 2.5mm or 0.1"), which are all connected to GPIO
- Pad (pre-bridged) linking one pin on each side to GND, can be cut
- Pad allowing one pin to link to DC supply (need to cut the series pad to disconnect from GPIO)
- Pad allowing one pin to link to 3.3V, e.g. pull up, or to power somethign external

![Generic2a](https://user-images.githubusercontent.com/996983/151692421-359f2ba7-d9bb-447f-9a19-a2da2b949f7f.png)

## ESP32-LowPower

Same as ESP32-Generic but for low power battery working.

- FET switched potential divide for ADC reading battery supply.
- Can work with USB chip disabled (power via DC connector instead)
- Approx 35uA on 9V battery in sleep mode

## ESP32-USBA

Unlike the rest this is a much simpler PCB, PCB designed for direct plug in to USB-A socket.

- RGB LED
- Button

![USBA](https://user-images.githubusercontent.com/996983/140615566-fc0d410a-a81b-4b3e-9b71-35afe68315ae.png)

Copyright © 2019-22 Adrian Kennard, Andrews & Arnold Ltd. See LICENCE file for details. GPL 3.0
