PREFIX = /usr/local/bin

install:
	install ./bin/rbenv-clean.sh $(PREFIX)/rbenv-clean
	install ./lib/uninstaller.rb ~/.rbenv/rbenv_clean_gems.rb

uninstall:
	@rm -rf $(PREFIX)/rbenv-clean
	@rm -rf ~/.rbenv/rbenv_clean_gems.rb
	
update:
	make uninstall
	make install

.PHONY: install uninstall update
