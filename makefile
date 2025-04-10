FILE = Main.py
COMPILER = Scripts/pyinstaller.exe
TARGET = efc.exe

all:
	$(COMPILER) -F .\$(FILE)

clean:
	rm -r .\dist .\build .\main.spec
