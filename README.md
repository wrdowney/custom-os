# myos
A custom side project OS. Created using tutorials from https://wiki.osdev.org/

To build the OS, you must have a GCC cross-compiler, see the link below for instructions:
https://wiki.osdev.org/GCC_Cross-Compiler

Once you have a GCC cross-compiler, you can build the project using the following commands:
cd src/
make myos.iso

This will build the project and make a bootable iso file.

To run the project with QEMU, cd back to the top directory and execute the following command:
qemu-system-i386 -cdrom myos.iso

The project is currently at the Bare Bones stage, it only outputs Hello, World! to the terminal.

TO-DO:
- Fix newline character reading
- RMHC Compliant Makefile
