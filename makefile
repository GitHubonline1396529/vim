# makefile
#
# Name: makefile
# Author: GitHubonline1396529
# Date: 2024/11/24
# License: MIT License Copyright (c) 2024 GitHubonline1396529
#
# Makefile to install vim configuration.

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

