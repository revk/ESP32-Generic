all:	png stl

stl:	GenericS3/GenericS3T.stl GenericS3/GenericS3B.stl

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

%.png:	%.kicad_pcb PCBCase/clean PCBCase/render
	PCBCase/render $<

GenericS3/GenericS3T.scad: GenericS3/GenericS3.kicad_pcb PCBCase/case PCBCase/case
	PCBCase/case -o $@ $< --edge=2 --top=6 --bottom=2 --pcb=2 --two-file --date-angle=90 --date-x=11.4

