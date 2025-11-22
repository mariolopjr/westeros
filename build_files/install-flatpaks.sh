#!/usr/bin/env sh
set ${SET_X:+-x} -eou pipefail

echo "Installing flatpaks"

flatpak install flathub --assumeyes \
    it.mijorus.gearlever \
    org.gnome.World.PikaBackup

