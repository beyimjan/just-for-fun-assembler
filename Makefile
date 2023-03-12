# Copyright (C) 2022, 2023 Tamerlan Bimzhanov

ifndef $(OS)
OS = $(shell uname -s | tr 'a-z' 'A-Z')
endif

OS_SUPPORTED = LINUX FREEBSD
ifeq (, $(filter $(OS), $(OS_SUPPORTED)))
$(error Unknown OS, only Linux and FreeBSD are supported)
endif

AS = nasm
ASFLAGS = -g -d OS_$(OS) -f elf
CPPFLAGS = -i include

LD = ld
LDFLAGS = -m elf_i386

BINS = kill cat

all: $(BINS)

clean:
	find . -name '*.o' -delete
	rm -f $(BINS)

%.o: %.asm
	$(AS) $(CPPFLAGS) $(ASFLAGS) $<

kill: kill.o modules/strlen.o modules/strtoi.o

cat: cat.o modules/putstr.o modules/transfer.o modules/strlen.o

$(BINS):
	$(LD) $(LDFLAGS) $^ -o $@

.PHONY: all clean
