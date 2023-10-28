# USBC board

A small PCB design to plug in directly to a USB-C socket. Ideal as a wall socket as this is a right angle connector.

Serial via USB direct to ESP32-S3.

Includes power supply and five WS2812B RGB LEDs, and then output to drive a chain of such LEDs.

Includes I2C device (a light sensor) for testing with I2C.

## Programming

Can be directly programmed using esptool, i.e. `idf.py flash` via the USB headers, or using the 5 pin serial pads on the back of the board.

![a 10 21 24](https://github.com/revk/ESP32-Generic/assets/996983/d017cf6b-085a-4da2-a82f-901047603031)
![a 11 17 18](https://github.com/revk/ESP32-Generic/assets/996983/92ac682a-49fa-42f7-9dca-0eda9d88f71f)
