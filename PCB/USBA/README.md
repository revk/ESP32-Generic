# USBA board

A small PCB design to plug in directly to an old school USB socket for power.
Serial via USB direct to ESP32-S3.

Includes power supply and RGB LED.
Includes temp/humidity sensor (temp will need calibration for being next to processor).

[Buy](https://www.amazon.co.uk/dp/B0CG3S8JX3)

## Programming

Can be directly programmed using esptool, i.e. `idf.py flash` via the USB headers, or using the 5 pin serial pads on the back of the board.

![317987](https://github.com/revk/ESP32-Generic/assets/996983/87e3286f-a79a-4632-a0d6-cc8ecdf14d2d)
![317985](https://github.com/revk/ESP32-Generic/assets/996983/e571ba73-9d8b-4ee3-bcae-dedce687a51c)
![317984](https://github.com/revk/ESP32-Generic/assets/996983/533ea0d0-54af-4beb-bae1-260d014b598b)
