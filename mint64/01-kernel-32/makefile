
all: virtual-operating-system.bin

virtual-operating-system.bin: virtual-operating-system.asm
	nasm -o virtual-operating-system.bin virtual-operating-system.asm

clean:
	del virtual-operating-system.bin