# Makefile
# 读取 config.mk 文件（如果存在）
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

