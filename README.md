Isabelle flatpak
----------------

This repository is an experiment packaging Isabelle releases as a flatpak.

Every release lives in a git branch and a flatpak branch with the same name
(`2024`, `2025`, `2025-2`, `2026`). The git branch `master` holds the latest
release.

`make build` exports the release into the local ostree repo `repo/` and
`make install` installs it from the `isabelle-origin` remote, so several
versions can be installed side by side:

    flatpak run --branch=2025-2 de.tum.in.isabelle.Isabelle
