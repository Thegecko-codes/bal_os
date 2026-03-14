CC = clang
CFLAGS = --target=aarch64-none-elf -ffreestanding -nostdlib -nostdinc -fno-builtin

SRCS = kernel/main.c kernel/uart.c
OBJS = boot/boot.o kernel/main.o kernel/uart.o

all: kernel.img

boot/start.o: boot/boot.S
	$(CC) $(CFLAGS) -c boot/boot.S -o boot/boot.o

kernel/main.o: kernel/main.c
	$(CC) $(CFLAGS) -c kernel/main.c -o kernel/main.o

kernel/uart.o: kernel/uart.c
	$(CC) $(CFLAGS) -c kernel/uart.c -o kernel/uart.o

kernel.elf: $(OBJS)
	ld.lld -T linker.ld -o kernel.elf $(OBJS)

kernel.img: kernel.elf
	llvm-objcopy -O binary kernel.elf kernel.img

clean:
	rm -f $(OBJS) kernel.elf kernel.img
