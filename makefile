TARGET=xd
CC=gcc
LIBDIR=-I.
COMMONFLAGS=-Wall -std=c99
# COMMONFLAGS+=-F/Library/Frameworks

LIDLIBS+=-lm

CFLAGS=$(COMMONFLAGS) $(LIBDIR)

#	Custom TTY
CUTLINE=------------------------------------------------------------->
TTY_NONE=\033[m
TTY_RED=\033[1;31m
TTY_GREEN=\033[1;32m
TTY_PURPLE=\033[1;35m

all:$(TARGET)
	@echo "$< Build Over $(CUTLINE) $(TTY_GREEN)"
	@echo "Launching...."
	@echo "$(TTY_NONE)"
	./$< -c -l 20 makefile

$(TARGET):src/*.c src/*.h
	@echo "Compiling $< $(CUTLINE) $(TTY_RED)"
	$(CC) $(CFLAGS) -o $@ $<
	@echo "$(TTY_NONE)"

install:$(TARGET)
	@echo "$@ $(CUTLINE)"
	cp $< /usr/local/bin/

uninstall:
	rm /usr/local/bin/xd

.PHONY: clean unsintall
clean:
	rm -rf $(TARGET)
