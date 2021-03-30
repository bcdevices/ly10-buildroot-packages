GIT_DESC := $(shell git describe --tags --always --dirty --match "v[0-9]*")
VERSION_TAG := $(patsubst v%,%,$(GIT_DESC))

BASE_PATH := $(realpath .)
DIST := $(BASE_PATH)/dist

.PHONY: versions
versions:
		@echo "GIT_DESC: $(GIT_DESC)"
		@echo "VERSION_TAG: $(VERSION_TAG)"

.PHONY: distclean
distclean:
	-rm -rf $(DIST)/*
	-mkdir -p $(DIST)

.PHONY: dist
dist:
	-mkdir -p $(DIST)
	tar --exclude="./dist" --exclude="./.git" --exclude="./.github" --xform s:'./':'package-$(VERSION_TAG)/': -czf $(DIST)/buildroot-packages-$(VERSION_TAG).tar.gz .


