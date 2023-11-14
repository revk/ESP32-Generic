# USBC board

A small PCB design to plug in directly to a USB-C socket. Ideal as a wall socket as this is a right angle connector.

Serial via USB direct to ESP32-S3.

Includes power supply and five WS2812B RGB LEDs, and then output to drive a chain of such LEDs.

Includes I2C device (a light sensor) for testing with I2C.

## Programming

Can be directly programmed using esptool, i.e. `idf.py flash` via the USB headers, or using the 5 pin serial pads on the back of the board.

![a 11 17 18](https://github.com/revk/ESP32-Generic/assets/996983/1138a731-c4a7-4d21-b609-63e9eddaf6c9)
![b 11 17 18](https://github.com/revk/ESP32-Generic/assets/996983/0293e38e-137f-4add-be47-ddafda3131c3)
