PREFIX ?= /usr/local

install: bin/rbenv-clean
	@cp -p $< $(PREFIX)/$<

uninstall:
	rm -f $(PREFIX)/bin/rbenv-clean

.PHONY: install uninstall
