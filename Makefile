#
# This is a project Makefile. It is assumed the directory this Makefile resides in is a
# project subdirectory.
#

PROJECT_NAME := Generic
SUFFIX := $(shell components/ESP32-RevK/buildsuffix)

all:	main/settings.h
	@echo Make: $(PROJECT_NAME)$(SUFFIX).bin
	@idf.py build
	@cp build/$(PROJECT_NAME).bin $(PROJECT_NAME)$(SUFFIX).bin
	@echo Done: $(PROJECT_NAME)$(SUFFIX).bin

beta:   
	-git pull
	-git submodule update --recursive
	-git commit -a
	@make set
	cp $(PROJECT_NAME)*.bin release/beta
	git commit -a -m Beta
	git push

issue:
	-git pull
	-git commit -a
	cp -f release/beta/$(PROJECT_NAME)*.bin release
	-git commit -a -m Release
	-git push

pull:
	git pull
	git submodule update --recursive

update:
	-git pull
	-git commit -a
	git submodule update --init --recursive --remote
	idf.py update-dependencies
	-git commit -a -m "Library update"

flash:
	idf.py flash

monitor:
	idf.py monitor

clean:
	idf.py clean

menuconfig:
	idf.py menuconfig

main/settings.h:     components/ESP32-RevK/revk_settings main/settings.def components/*/settings.def
	components/ESP32-RevK/revk_settings $^

components/ESP32-RevK/revk_settings: components/ESP32-RevK/revk_settings.c
	make -C components/ESP32-RevK

set:    lcd2 s3

gd7965:
	components/ESP32-RevK/setbuildsuffix -S3-MINI-N4-R2-GD7965
	@make

lcd2:
	components/ESP32-RevK/setbuildsuffix -S3-MINI-N4-R2-LCD2
	@make

s3:
	components/ESP32-RevK/setbuildsuffix -S3-MINI-N4-R2-GFXNONE
	@make

pico:
	components/ESP32-RevK/setbuildsuffix -S1-PICO-SSD1681
	@make

wroom:
	components/ESP32-RevK/setbuildsuffix -S1-SSD1681
	@make

solo:	# This is Shellys and no display
	components/ESP32-RevK/setbuildsuffix -S1-SOLO
	@make

