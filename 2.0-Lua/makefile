FILE   = Main.lua
TARGET = efc/
LIB    = /usr/lib/
BIN    = /usr/bin/

all:
	mkdir $(LIB)$(TARGET)
	cp efc $(BIN)
	cp -rf ./* $(LIB)$(TARGET)

install:
	$(MAKE)

uninstall:
	rm -rf $(LIB)$(TARGET)
	rm -rf $(BIN)efc

update:
	$(MAKE) uninstall
	$(MAKE) install
