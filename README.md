# ESP32-Generic

Software and hardware for generic ESP32 usage. Software based on ESP32-RevK library.

# Hardware

Various KiCad designs, with 3D printed case designs.

- USB-C connection for power and also debug/serial.
- Alternative external DC supply 4V to 60V (safe to connect at same time as USB-C)
- On board RGB LED.

## ESP01 Style ESP32 board

- Even smaller than ESP01 (13.2mm x 23.4mm including antenna)
- Same pin out (though RST is just a GPIO on this)

![Generic01](https://user-images.githubusercontent.com/996983/154910368-08a94680-f98b-4543-9405-6571c8da761c.png)

## ESP32-Generic

- Very small size (29mm x 19mm PCB, plus antenna)
- ESP32-WROOM-32 design
- 6 pin connector (SPOX 2.5mm or 0.1"), which are GND and 5xGPIO
- Pads to allow linking one pin to DC supply (and not linking to GPIO)
- Pads to allow linking other pins to 3.3V, e.g. pull ups, or to power somethign external
- Pad to allow linking one pin to GND, e.g. capacitor

![Generic](https://user-images.githubusercontent.com/996983/151692417-bf97f5b4-017b-4074-9edc-952c1f0526cb.png)

## ESP32-Generic2

- Larger PCB (35.5mm x 22.5mm, plus antenna)
- ESP32-WROOM-32 design
- Two 8 pin connectors (SPOX 2.5mm or 0.1"), which are all connected to GPIO
- Pad (pre-bridged) linking one pin on each side to GND, can be cut
- Pad allowing one pin to link to DC supply (need to cut the series pad to disconnect from GPIO)
- Pad allowing one pin to link to 3.3V, e.g. pull up, or to power somethign external

![Generic2a](https://user-images.githubusercontent.com/996983/151692421-359f2ba7-d9bb-447f-9a19-a2da2b949f7f.png)

## ESP32-Generic3

- Larger PCB (35mm x 21.5mm, plus antenna)
- ESP32-NANO-PICO based design
- 2 pin connector for DC (SPOX 2.5mm or 0.1")
- 10 pin GPIO connector (SPOX 2.5mm or 0.1")
- Pads to allow a GPIO to be tied to GND and one to be tied to 3.3V to power a separate device if needed

![a](https://user-images.githubusercontent.com/996983/154688606-ff696f24-0eac-4adf-965b-7ab453dbc4a4.png)

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
