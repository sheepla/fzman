PREFIX ?= /usr/local
FZMAN_SRC_PATH := fzman
FZMAN_DEST_PATH := $(PREFIX)/bin/fzman
README_SRC_PATH := README.md
README_DEST_PATH := $(PREFIX)/share/doc/fzman/
LICENSE_SRC_PATH := LICENSE
LICENSE_DEST_PATH := $(PREFIX)/share/licences/fzman/

.PHONY: install
install:
	install -Dm 0644 $(README_SRC_PATH) $(README_DEST_PATH)
	install -Dm 0644 $(LICENSE_SRC_PATH) $(LICENSE_DEST_PATH)
	install -Dm 0755 $(FZMAN_SRC_PATH) $(FZMAN_DEST_PATH)

.PHONY: uninstall
uninstall:
	rm -f $(FZMAN_DEST_PATH)
	rm -f $(LICENSE_DEST_PATH)
	rm -f $(LICENSE_DEST_PATH)

.PHONY: format
format:
	shfmt -w $(FZMAN_SRC_PATH)

.PHONY: lint
lint:
	shellcheck $(FZMAN_SRC_PATH)
