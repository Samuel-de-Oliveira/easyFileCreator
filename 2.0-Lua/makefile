TARGET = efc/
LIB    = /usr/lib/
BIN    = /usr/bin/
SHARE  = /usr/share/

all:
	mkdir $(LIB)$(TARGET)
	cp efc $(BIN)
	cp -rf ./* $(LIB)$(TARGET)
	cp -rf efc_library/ $(SHARE)lua/5.4/

install:
	$(MAKE)

uninstall:
	rm -rf $(LIB)$(TARGET)
	rm -rf $(BIN)efc

update:
	$(MAKE) uninstall
	$(MAKE) install

build_test:
	srlua/glue srlua/srlua Main.lua efc.out
	chmod a+rwx efc.out
