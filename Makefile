ID       := de.tum.in.isabelle.Isabelle
MANIFEST := $(ID).yml
REPO     := repo
REMOTE   := isabelle-origin
# The flatpak branch is the Isabelle version, read from the manifest.
BRANCH   := $(shell sed -n "s/^branch: '\(.*\)'/\1/p" $(MANIFEST))

build:
	flatpak run org.flatpak.Builder --user --force-clean --disable-rofiles-fuse --repo=$(REPO) build-dir $(MANIFEST)
	flatpak build-update-repo $(REPO)

install:
	flatpak install --user --reinstall -y $(REMOTE) $(ID)//$(BRANCH)

.PHONY: build install
