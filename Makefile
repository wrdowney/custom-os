#compiler: we are using a custom built cross compiler
CC = i686-elf-gcc

#assembler
AS = i686-elf-as

#linking flags
LFLAGS = -ffreestanding -O2 -nostdlib

#compile flags
CFLAGS = -std=gnu99 -ffreestanding -O2 -Wall -Wextra

#libraries to link into executable
LIBS = -lgcc

#C source files
CSRCS = kernel.c

#ASM source files
ASRCS = boot.s

#C object files (replace suffix with .o)
OBJS = $(CSRCS:.c=.o) $(ASRCS:.a=.o)

#define executable
MAIN = myos.bin

all: link

link: boot.o kernel.o
	$(CC) -T linker.ld -o $(MAIN) $(LFLAGS) $(OBJS) $(LIBS)

boot.o: boot.s
	$(AS) boot.s -o boot.o

kernel.o: kernel.c 
	$(CC) -c kernel.c -o kernel.o $(CFLAGS)

myos.iso: link
	mkdir -p isodir/boot/grub
	cp myos.bin isodir/boot/myos.bin
	cp grub.cfg isodir/boot/grub/grub.cfg
	grub-mkrescue -o myos.iso isodir
