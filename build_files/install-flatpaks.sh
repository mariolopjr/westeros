#!/usr/bin/env sh
set ${SET_X:+-x} -eou pipefail

echo "Installing flatpaks"

flatpak install flathub --assumeyes \
    it.mijorus.gearlever \
	md.obsidian.Obsidian \
    org.gnome.World.PikaBackup \
    io.github.neil_morrison44.pocket-sync \
	dev.vencord.Vesktop

