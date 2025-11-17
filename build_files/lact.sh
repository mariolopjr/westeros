#!/usr/bin/env sh
set ${SET_X:+-x} -eou pipefail

# From enitimeago/eniblue: https://github.com/enitimeago/eniblue/raw/refs/heads/main/build_files/build.sh

dnf5 -y copr enable ilyaz/LACT
dnf5 install -y lact
dnf5 -y copr disable ilyaz/LACT

systemctl enable lactd

