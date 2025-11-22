#!/usr/bin/env sh
set ${SET_X:+-x} -eou pipefail

echo "Removing packages"

dnf5 remove -y \
    kate \
    kwrite \
    ptyxis

