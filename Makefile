#
# This is a project Makefile. It is assumed the directory this Makefile resides in is a
# project subdirectory.
#

PROJECT_NAME := Generic
SUFFIX := $(shell components/ESP32-RevK/buildsuffix)
MODELS := Generic LowPower Generic2 Generic3 Generic4 Generic5

all:
	@echo Make: $(PROJECT_NAME)$(SUFFIX).bin
	@idf.py build
	@cp build/$(PROJECT_NAME).bin $(PROJECT_NAME)$(SUFFIX).bin
	@echo Done: $(PROJECT_NAME)$(SUFFIX).bin

tools: envlog envgraph taspowerlog taspowersvg

set:    wroom solo pico

pico:
	components/ESP32-RevK/setbuildsuffix -S1-PICO-SSD1681
	@make

wroom:
	components/ESP32-RevK/setbuildsuffix -S1-SSD1681
	@make

solo:
	components/ESP32-RevK/setbuildsuffix -S1-SOLO-SSD1681
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

scad:	$(patsubst %,KiCad/%.scad,$(MODELS))
stl:	$(patsubst %,KiCad/%.stl,$(MODELS))

%.stl: %.scad
	echo "Making $@"
	/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD $< -o $@
	echo "Made $@"

KiCad/Generic.scad: KiCad/Generic.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=2

KiCad/Generic2.scad: KiCad/Generic2.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=2

KiCad/Generic3.scad: KiCad/Generic3.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=2

KiCad/Generic4.scad: KiCad/Generic4.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=2.6

KiCad/Generic5.scad: KiCad/Generic5.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=2.6

KiCad/LowPower.scad: KiCad/LowPower.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=2

