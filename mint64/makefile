
all: build-boot-loader kernel-32 build-disk-image

build-boot-loader:
	@echo [Starting to build the boot-loader...]
	mingw32-make -C 00-boot-loader
	@echo [Finished to build the boot-loader]

kernel-32:
	@echo [Starting to build the 32-bit kernel...]
	mingw32-make -C 01-kernel-32
	@echo [Finished to build the 32-bit kernel...]

build-disk-image: build-boot-loader kernel-32
	@echo [Starting to build the disk image...]
	copy /b 00-boot-loader\boot-loader.bin + 01-kernel-32\virtual-operating-system.bin disk.img
	@echo [Finished to build the disk image]

clean:
	mingw32-make -C 00-boot-loader clean
	mingw32-make -C 01-kernel-32 clean
	del disk.img