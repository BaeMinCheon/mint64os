
all: boot-loader.bin

boot-loader.bin: boot-loader.asm
	nasm -o boot-loader.bin boot-loader.asm

clean:
	del boot-loader.bin