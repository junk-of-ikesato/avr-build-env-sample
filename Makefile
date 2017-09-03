PROG=blink
OBJS=${PROG}.o
MCU=attiny85
F_CPU=1000000UL # internal 8MHz clock & CKDIV8 fuse bit enabled
#--------

ELF=$(PROG)
HEX=$(PROG).hex

CC=avr-gcc
CFLAGS=-g -O2 -mmcu=$(MCU) -DF_CPU=$(F_CPU)
LDFLAGS=-g -O2 -mmcu=$(MCU) -Wl,-Map,$(PROG).map
OBJCOPY=avr-objcopy

all: $(HEX)

$(HEX): $(ELF)

$(ELF): $(OBJS)

%.hex: %
	$(OBJCOPY) -j .text -j .data -O ihex $< $@

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<
	avr-objdump -S $@ > $@.map

clean:
	-$(RM) $(ELF) $(HEX) $(OBJS) *.map

.PHONY: all clean
