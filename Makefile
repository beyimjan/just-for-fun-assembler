# Copyright (C) 2022, 2023 Tamerlan Bimzhanov

AS = nasm
ASFLAGS = -g -d OS_LINUX -f elf -i include

LD = ld
LDFLAGS = -m elf_i386

BINS = kill cat

all: $(BINS)

clean:
	find . -name '*.o' -delete
	rm -f $(BINS)

%.o: %.asm
	$(AS) $(ASFLAGS) $<

kill: kill.o modules/strlen.o modules/strtoi.o

cat: cat.o modules/putstr.o modules/transfer.o modules/strlen.o

$(BINS):
	$(LD) $(LDFLAGS) $^ -o $@

.PHONY: all clean
