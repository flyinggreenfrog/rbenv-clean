PREFIX = /usr/local/bin

install: bin/rbenv-clean
	@cp -p $< $(PREFIX)/rbenv-clean
	echo "rbenv-clean(1) installed"
	rbenv help clean
uninstall:
	rm -rf $(PREFIX)/rbenv-clean

.PHONY: install
