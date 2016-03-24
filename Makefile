PREFIX = /usr/local/bin
RBENV_LIB_DIR = $(HOME)/.rbenv


install:
	mkdir -p $(RBENV_LIB_DIR)
	cp ./bin/rbenv-clean.sh $(PREFIX)/rbenv-clean
	cp ./lib/uninstaller.rb $(RBENV_LIB_DIR)/rbenv_clean_gems.rb

uninstall:
	@rm -rf $(PREFIX)/rbenv-clean
	@rm -rf $(RBENV_LIB_DIR)/rbenv_clean_gems.rb

update:
	make uninstall
	make install

.PHONY: install uninstall update
