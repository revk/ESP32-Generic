# USBA board

A small PCB design to plug in directly to an old school USB socket for power.
Serial via USB direct to ESP32-S3.

- Includes power supply and WS2812B RGB LED, and then output to drive a chain of such LEDs.
- Includes I2C device (a light sensor) for testing with I2C.
- Includes pads for a button to be fitted to the back.

[Buy](https://www.amazon.co.uk/dp/B0CG3S8JX3) Note some older boards may be simpler RGB LED and env sensor I2C and no button pads.

## Programming

Can be directly programmed using esptool, i.e. `idf.py flash` via the USB headers, or using the 5 pin serial pads on the back of the board.

![317987](https://github.com/revk/ESP32-Generic/assets/996983/87e3286f-a79a-4632-a0d6-cc8ecdf14d2d)
![317985](https://github.com/revk/ESP32-Generic/assets/996983/e571ba73-9d8b-4ee3-bcae-dedce687a51c)
![317984](https://github.com/revk/ESP32-Generic/assets/996983/533ea0d0-54af-4beb-bae1-260d014b598b)
