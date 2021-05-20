FZMAN_SRC_PATH := fzman
FZMAN_DEST_PATH := /usr/local/bin/fzman

.PHONY: install
install:
	install -Dm 0755 $(FZMAN_SRC_PATH) $(DESTDIR)$(FZMAN_DEST_PATH)

.PHONY: uninstall
uninstall:
	rm -f $(DESTDIR)$(FZMAN_DEST_PATH)

.PHONY: format
format:
	shfmt -w $(FZMAN_SRC_PATH)

.PHONY: lint
lint:
	shellcheck $(FZMAN_SRC_PATH)
