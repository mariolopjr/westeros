# Custom recipes for westeros
# These commands are available via 'ujust <command>'
# Mainly based off of dkolb/bazzite-dkub: https://raw.githubusercontent.com/dkolb/bazzite-dkub/refs/heads/main/build_files/files/usr/share/ublue-os/just/60-custom.just

# Install common AppImages to ~/AppImages directory
install-appimages:
    #!/usr/bin/env bash
    set -euo pipefail
    echo "Installing AppImages to ~/AppImages..."
    mkdir -p ~/AppImages

    @just install-openrgb

# Install individual AppImages
install-openrgb:
    #!/usr/bin/env sh
    set -euo pipefail

    # Download OpenRGB appimage
    echo "Downloading OpenRGB..."
    curl -L "https://codeberg.org/OpenRGB/OpenRGB/releases/download/release_candidate_1.0rc2/OpenRGB_1.0rc2_x86_64_0fca93e.AppImage" \
      -o ~/AppImages/openrgb.appimage
    chmod +x ~/AppImages/openrgb.appimage

    # Integrate with custom update URLs
    echo "Integrating OpenRGB with GearLever..."
    flatpak run it.mijorus.gearlever --integrate ~/AppImages/openrgb.appimage --yes \
      --update-url 'https://codeberg.org/OpenRGB/OpenRGB/releases/download/*/OpenRGB*_x86_64_*.AppImage'

    echo "OpenRGB installed and integrated with GearLever"

# Install GearLever for managing AppImages
install-gearlever:
    flatpak install -y --user flathub it.mijorus.gearlever
    echo "✅ GearLever installed - use it to manage your AppImages"

