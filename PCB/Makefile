all:	png stl

stl:	GenericS3B.stl GenericS3T/stl

png:	$(patsubst %.kicad_pcb,%.png,$(wildcard */*.kicad_pcb))

PCBCase/case: PCBCase/case.c
	make -C PCBCase

PCBCase/clean: PCBCase/clean.c
	make -C PCBCase

%.stl: %.scad
	echo "Making $@"
	/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD $< -o $@
	echo "Made $@"

update:
	-git pull
	git submodule update --init --recursive --remote
	-git commit -a -m "Library update"
	-git push

%.png:	%.kicad_pcb PCBCase/clean PCBCase/render Makefile
	PCBCase/render $<

GenericS3/GenericS3B.scad: Faikin/Faikin.kicad_pcb PCBCase/case PCBCase/case
	PCBCase/case -o $@ $< --edge=2 --top=7 --bottom=3 --pcb=2 --two-file --lip-type=1

