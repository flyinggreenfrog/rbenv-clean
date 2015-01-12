PREFIX = $(RBENV_ROOT)/plugins
SRC = bin/rbenv-clean.sh

install:

	if [[ ! -d $(PREFIX)]]; then \
		sudo mkdir -p $(PREFIX) \
	fi
	@cp -p $(SRC) $(PREFIX)/rbenv-clean
	echo "rbenv-clean(1) installed"

uninstall:
	rm -rf $(PREFIX)/rbenv-clean

update:
	make uninstall
	make install

.PHONY: install uninstall
