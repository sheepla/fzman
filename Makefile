PREFIX ?= /usr/local
BINDIR := $(PREFIX)/bin
SHAREDIR := $(PREFIX)/share

FZMAN_SRC_PATH := fzman
FZMAN_DEST_PATH := $(BINDIR)/fzman
README_SRC_PATH := README.md
README_DEST_PATH := $(SHAREDIR)/doc/fzman/README.md
LICENSE_SRC_PATH := LICENSE
LICENSE_DEST_PATH := $(SHAREDIR)/licences/fzman/LICENSE

.PHONY: install
install:
	install -Dm 0644 $(README_SRC_PATH) $(README_DEST_PATH)
	install -Dm 0644 $(LICENSE_SRC_PATH) $(LICENSE_DEST_PATH)
	install -Dm 0755 $(FZMAN_SRC_PATH) $(FZMAN_DEST_PATH)

.PHONY: uninstall
uninstall:
	rm -f $(FZMAN_DEST_PATH)
	rm -f $(README_DEST_PATH)
	rm -f $(LICENSE_DEST_PATH)

.PHONY: format
format:
	shfmt -w $(FZMAN_SRC_PATH)

.PHONY: lint
lint:
	shellcheck $(FZMAN_SRC_PATH)
