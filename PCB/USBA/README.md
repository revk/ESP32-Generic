# USBA board

A small PCB design to plug in directly to an old school USB socket for power.
Serial via USB direct to ESP32-S3.

Includes power supply and RGB LED.
Includes temp/humidity sensor (temp will need calibration for being next to processor).

[Buy](https://www.amazon.co.uk/dp/B0CG3S8JX3)

## Programming

Can be directly programmed using esptool, i.e. `idf.py flash` via the USB headers, or using the 5 pin serial pads on the back of the board.

![312187](https://github.com/revk/ESP32-Generic/assets/996983/c7bb223a-9501-4a6a-8171-b479ca90edae)
![312186](https://github.com/revk/ESP32-Generic/assets/996983/0b9fffea-21ce-40d4-989c-02ad63b8285d)
![312183](https://github.com/revk/ESP32-Generic/assets/996983/cfdb961d-5d39-43b9-b3ae-6e837b5b82cd)
![312188](https://github.com/revk/ESP32-Generic/assets/996983/97a91ffa-817e-4ca0-b0f0-c57ee615b7a3)
