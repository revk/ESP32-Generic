#
# This is a project Makefile. It is assumed the directory this Makefile resides in is a
# project subdirectory.
#

PROJECT_NAME := Generic
SUFFIX := $(shell components/ESP32-RevK/buildsuffix)

all:	
	@echo Make: $(PROJECT_NAME)$(SUFFIX).bin
	@idf.py build
	@cp build/$(PROJECT_NAME).bin $(PROJECT_NAME)$(SUFFIX).bin
	@echo Done: $(PROJECT_NAME)$(SUFFIX).bin

set:    wroom solo pico

pico:
	components/ESP32-RevK/setbuildsuffix -S1-PICO-SSD1681
	@make

wroom:
	components/ESP32-RevK/setbuildsuffix -S1-SSD1681
	@make

solo:	# This is Shellys and no display
	components/ESP32-RevK/setbuildsuffix -S1-SOLO
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

%.stl: %.scad
	echo "Making $@"
	/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD $< -o $@
	echo "Made $@"

stl:	PCB/Generic/Generic.stl PCB/Generic2/Generic2.stl PCB/Generic3/Generic3.stl PCB/Generic4/Generic4.stl PCB/LED/LED.stl PCB/LowPower/LowPower.stl PCB/USBA/USBA.stl

PCB/Generic/Generic.scad: PCB/Generic/Generic.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=2

PCB/Generic2/Generic2.scad: PCB/Generic2/Generic2.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=2

PCB/Generic3/Generic3.scad: PCB/Generic3/Generic3.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=2

PCB/Generic4/Generic4.scad: PCB/Generic4/Generic4.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=2.6

PCB/LED/LED.scad: PCB/LED/LED.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=2.6

PCB/LowPower/LowPower.scad: PCB/LowPower/LowPower.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=2

PCB/USBA/USBA.scad: PCB/USBA/USBA.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=2

