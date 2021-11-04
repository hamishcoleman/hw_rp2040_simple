#
#
#

all: build/hello_usb.uf2

.PHONY: build-deps
build-deps:
	sudo apt-get install -y git cmake gcc-arm-none-eabi

.PHONY: submodules
submodules:
	git submodule update --init --recursive

.PHONY: build
build:
	mkdir -p build

.PHONY: build-env
build-env: submodules build

build/Makefile: env CMakeLists.txt
	cmake -B build -DCMAKE_BUILD_TYPE=Debug

build/hello_usb.uf2: build/Makefile
	make -C build
