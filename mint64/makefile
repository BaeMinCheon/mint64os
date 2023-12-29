
all: build-boot-loader build-disk.img

build-boot-loader:
	@echo [Starting to build the boot-loader...]
	mingw32-make -C 00-boot-loader
	@echo [Finished to build the boot-loader...]

build-disk.img: 00-boot-loader/boot-loader.bin
	@echo [Starting to build the disk.img...]
	copy 00-boot-loader/boot-loader.bin disk.img
	@echo [Finished to build the disk.img...]

clean:
	mingw32-make -C 00-boot-loader clean
	del disk.img