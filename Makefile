#
# This is a project Makefile. It is assumed the directory this Makefile resides in is a
# project subdirectory.
#

PROJECT_NAME := Generic
SUFFIX := $(shell components/ESP32-RevK/suffix)

all:
	@echo Make: build/$(PROJECT_NAME)$(SUFFIX).bin
	@idf.py build
	@cp build/$(PROJECT_NAME).bin build/$(PROJECT_NAME)$(SUFFIX).bin
	@echo Done: build/$(PROJECT_NAME)$(SUFFIX).bin

tools: envlog envgraph taspowerlog taspowersvg

set:    wroom solo pico

pico:
	@sed -e 's/# CONFIG_ESP32_SPIRAM_SUPPORT is not set/CONFIG_ESP32_SPIRAM_SUPPORT=y/' -e 's/# CONFIG_ESPTOOLPY_FLASHSIZE_8MB is not set/CONFIG_ESPTOOLPY_FLASHSIZE_8MB=y/' -e 's/CONFIG_ESPTOOLPY_FLASHSIZE_4MB=y/# CONFIG_ESPTOOLPY_FLASHSIZE_4MB is not set/' -e 's/CONFIG_FREERTOS_UNICORE=y/# CONFIG_FREERTOS_UNICORE is not set/' sdkconfig > sdkconfig.new
	@mv -f sdkconfig.new sdkconfig
	@make

wroom:
	@sed -e 's/CONFIG_ESP32_SPIRAM_SUPPORT=y/# CONFIG_ESP32_SPIRAM_SUPPORT is not set/' -e 's/# CONFIG_ESPTOOLPY_FLASHSIZE_4MB is not set/CONFIG_ESPTOOLPY_FLASHSIZE_4MB=y/' -e 's/CONFIG_ESPTOOLPY_FLASHSIZE_8MB=y/# CONFIG_ESPTOOLPY_FLASHSIZE_8MB is not set/' -e 's/CONFIG_FREERTOS_UNICORE=y/# CONFIG_FREERTOS_UNICORE is not set/' sdkconfig > sdkconfig.new
	@mv -f sdkconfig.new sdkconfig
	@make

solo:
	@sed -e 's/CONFIG_ESP32_SPIRAM_SUPPORT=y/# CONFIG_ESP32_SPIRAM_SUPPORT is not set/' -e 's/# CONFIG_ESPTOOLPY_FLASHSIZE_4MB is not set/CONFIG_ESPTOOLPY_FLASHSIZE_4MB=y/' -e 's/CONFIG_ESPTOOLPY_FLASHSIZE_8MB=y/# CONFIG_ESPTOOLPY_FLASHSIZE_8MB is not set/' -e 's/# CONFIG_FREERTOS_UNICORE is not set/CONFIG_FREERTOS_UNICORE=y/' sdkconfig > sdkconfig.new
	@mv -f sdkconfig.new sdkconfig
	@make

flash:
	idf.py flash

monitor:
	idf.py monitor

clean:
	idf.py clean

menuconfig:
	idf.py menuconfig

pull:
	git pull
	git submodule update --recursive

update:
	git submodule update --init --recursive --remote
	git commit -a -m "Library update"

# Set GPIO low (whichever CBUS is set to mode 8/GPIO)
bootmode: ftdizap/ftdizap
	./ftdizap/ftdizap --cbus=0

# Flash with GPIO control using CBUS0 (FT230X design)
zap:    bootmode flash
	./ftdizap/ftdizap --cbus=1 --reset

# Program the FTDI
ftdi3: ftdizap/ftdizap
	./ftdizap/ftdizap --serial="RevK" --description="Generic" --cbus0-mode=7 --cbus1-mode=13 --cbus2-mode=17 --self-powered=1

ftdi5: ftdizap/ftdizap
	./ftdizap/ftdizap --serial="RevK" --description="Generic" --cbus2-mode=17 --self-powered=1

ftdi: ftdizap/ftdizap
	./ftdizap/ftdizap --serial="RevK" --description="Generic" --cbus0-mode=7 --cbus1-mode=13

ftdi-invert: ftdizap/ftdizap
	./ftdizap/ftdizap --serial="RevK" --description="Generic" --cbus0-mode=7 --cbus1-mode=13 --invert-rts=1 --invert-dtr=1

ftdizap/ftdizap: ftdizap/ftdizap.c
	make -C ftdizap

PCBCase/case: PCBCase/case.c
	make -C PCBCase

scad: KiCad/Generic.scad KiCad/LowPower.scad KiCad/Generic2.scad KiCad/Generic3.scad KiCad/Generic4.scad KiCad/Generic5.scad
stl: KiCad/Generic.stl KiCad/LowPower.stl KiCad/Generic2.stl KiCad/Generic3.stl KiCad/Generic4.stl KiCad/Generic5.stl

%.stl: %.scad
	echo "Making $@"
	/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD $< -o $@
	echo "Made $@"

KiCad/Generic.scad: KiCad/Generic.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=3.5

KiCad/Generic2.scad: KiCad/Generic2.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=3.5

KiCad/Generic3.scad: KiCad/Generic3.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=2

KiCad/Generic4.scad: KiCad/Generic4.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=3.5

KiCad/Generic5.scad: KiCad/Generic5.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=3.5

KiCad/LowPower.scad: KiCad/LowPower.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=3.5

