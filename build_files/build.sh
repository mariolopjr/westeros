#!/usr/bin/env sh
set ${SET_X:+-x} -eou pipefail

### Install packages
# TODO: add udica: https://github.com/containers/udica
dnf5 install -y \
    firewall-config \
    flatpak-builder \
    jetbrains-mono-fonts-all \
    neovim

### Install packages from terra
dnf5 -y config-manager setopt "terra".enabled=1
dnf5 install -y \
    coolercontrol liquidctl
dnf5 -y config-manager setopt "terra".enabled=0

# Install from ublue staging
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y copr disable ublue-os/staging

dnf5 -y copr enable wezfurlong/wezterm-nightly
dnf5 install -y wezterm
dnf5 -y copr disable wezfurlong/wezterm-nightly

# Run scripts
/ctx/1password.sh
/ctx/lact.sh

/ctx/remove-packages.sh

### Enable services
systemctl enable podman.socket
systemctl enable coolercontrold

