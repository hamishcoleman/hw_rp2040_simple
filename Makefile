#
#
#

all:
	false

.PHONY: build-deps
build-deps:
	sudo apt-get install -y git cmake gcc-arm-none-eabi

.PHONY: submodules
submodules:
	git submodule update --init --recursive
