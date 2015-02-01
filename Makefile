PREFIX = /usr/local/bin

install:
	install ./bin/rbenv-clean.sh $(PREFIX)/rbenv-clean

uninstall:
	@rm -rf $(PREFIX)/rbenv-clean

update:
	make uninstall
	make install

.PHONY: install uninstall update
