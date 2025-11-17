#!/bin/bash

set -ouex pipefail

### Install packages from terra
# dnf5 -y config-manager setopt "terra".enabled=true
# dnf5 -y config-manager setopt "terra-nvidia".enabled=true
# dnf5 install -y \
#     rofi
# dnf5 -y config-manager setopt "terra".disabled=true
# dnf5 -y config-manager setopt "terra-nvidia".disabled=true

# Install from ublue staging
# TODO: add udica: https://github.com/containers/udica
dnf5 -y copr enable ublue-os/staging
dnf5 install -y              \
    jetbrains-mono-fonts-all \
    flatpak-builder          \
    neovim                   \
    firewall-config
dnf5 -y copr disable ublue-os/staging

# Install Ghostty
dnf5 -y copr enable scottames/ghostty
dnf5 install -y ghostty
dnf5 -y copr disable scottames/ghostty

# Run scripts
/ctx/1password.sh

### Enable services
systemctl enable podman.socket

