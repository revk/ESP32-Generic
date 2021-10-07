#
# This is a project Makefile. It is assumed the directory this Makefile resides in is a
# project subdirectory.
#

PROJECT_NAME := Generic

include $(IDF_PATH)/make/project.mk

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
ftdi: ftdizap/ftdizap
	./ftdizap/ftdizap --serial="RevK" --description="Generic" --cbus0-mode=7 --cbus1-mode=13 --invert-rts=1 --invert-dtr=1

ftdizap/ftdizap: ftdizap/ftdizap.c
	make -C ftdizap

PCBCase/case: PCBCase/case.c
	make -C PCBCase

scad: KiCad/Generic.scad KiCad/Generic-nohole.scad
stl: KiCad/Generic.stl KiCad/Generic-nohole.stl

%.stl: %.scad
	echo "Making $@"
	/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD $< -o $@
	echo "Made $@"

KiCad/Generic.scad: KiCad/Generic.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=4.9

KiCad/Generic-nohole.scad: KiCad/Generic.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=4.9 --ignore=J3

