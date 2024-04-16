FILE   = Main.lua
TARGET = efc/
LIB    = /usr/lib/
BIN    = /usr/bin/

.PHONY: all install unistall

all:
	mkdir $(LIB)$(TARGET)
	cp efc $(BIN)
	cp ./* $(LIB)$(TARGET)

install:
	$(MAKE)

unistall:
	rm -rf $(LIB)$(TARGET)
	rm -rf $(BIN)efc

update:
	$(MAKE) uninstall
	$(MAKE) install
