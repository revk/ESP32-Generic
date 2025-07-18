all:	png stl

stl:	

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
