#
#
#

TARGET:=build/hello_usb.uf2
all: ${TARGET}

.PHONY: build-deps
build-deps:
	sudo apt-get install -y git cmake gcc-arm-none-eabi

.submodules:
	git submodule update --init --recursive
	touch $@
CLEAN+=.submodules

.PHONY: build
build:
	mkdir -p build

.PHONY: build-env
build-env: .submodules build

build/Makefile: build-env CMakeLists.txt
	cmake -B build -DCMAKE_BUILD_TYPE=Debug

build/hello_usb.uf2: build/Makefile
	make -C build

.PHONY: clean
clean:
	make -C build clean

.PHONY: realclean
realclean:
	rm -rf build
	rm -f $(CLEAN)

.PHONY: mount
mount:
	udisksctl mount -b $(shell sudo blkid -o device --match-token LABEL="RPI-RP2" |head -1)

.PHONY: copy
copy: ${TARGET}
	cp $< /media/${LOGNAME}/RPI-RP2/
