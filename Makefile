PREFIX = /usr/local/bin
SRC = bin/rbenv-clean.sh

install:
	@cp -p $(SRC) $(PREFIX)/rbenv-clean
	echo "rbenv-clean(1) installed"
	rbenv help clean

uninstall:
	rm -rf $(PREFIX)/rbenv-clean

.PHONY: install
