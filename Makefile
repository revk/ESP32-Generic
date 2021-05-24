#
# This is a project Makefile. It is assumed the directory this Makefile resides in is a
# project subdirectory.
#

PROJECT_NAME := BatMon

include $(IDF_PATH)/make/project.mk

update:
	git submodule update --init --recursive --remote
	git commit -a -m "Library update"

# Program the FTDI
ftdi: ftdizap/ftdizap
	./ftdizap/ftdizap --serial="RevK" --description="BatMon" --cbus0-mode=7 --cbus1-mode=13 --invert-rts=1 --invert-dtr=1

ftdizap/ftdizap: ftdizap/ftdizap.c
	make -C ftdizap

PCBCase/case: PCBCase/case.c
	make -C PCBCase

scad: KiCad/Battery.scad KiCad/Battery-nohole.scad
stl: KiCad/Battery.stl KiCad/Battery-nohole.stl

%.stl: %.scad
	echo "Making $@"
	/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD $< -o $@
	echo "Made $@"

KiCad/Battery.scad: KiCad/Battery.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=4.9

KiCad/Battery-nohole.scad: KiCad/Battery.kicad_pcb PCBCase/case Makefile
	PCBCase/case -o $@ $< --edge=2 --base=4.9 --ignore=J3

