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
	./ftdizap/ftdizap --serial="RevK" --description="BatMon" --cbus0-mode=17 --cbus1-mode=13 --invert-rts=1 --invert-dtr=1

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

