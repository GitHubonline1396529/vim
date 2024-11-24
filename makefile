# Makefile
# Read config.mk file (If exist)
-include config.mk

all:
	@echo "Building project..."

install:
	@echo "Installing to $(PREFIX)"
	cp -r ./init $(PREFIX)/
	cp -r ./autoload $(PREFIX)/
	cp -r ./colors $(PREFIX)/
	cp -r ./plugged $(PREFIX)/
	cp -r ./doc $(PREFIX)/
	cp ./init.vim $(PREFIX)/
	cp ./vimtweak64.dll $(PREFIX)/

