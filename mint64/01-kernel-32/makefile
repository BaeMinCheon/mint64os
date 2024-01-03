
all: kernel-32.bin

kernel-32.bin: source/entry-point.asm
	nasm -o kernel-32.bin source/entry-point.asm

clean:
	del kernel-32.bin