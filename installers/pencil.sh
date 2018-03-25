#!/bin/bash

# http://pencil.evolus.vn/Downloads.html

set -euo pipefail
IFS=$'\n\t'

VERSION=3.0.4
ARCH=amd64

cleanup() {
  rm /tmp/pencil.deb
}

install() {
  # Download archive
  curl -#Lo /tmp/pencil.deb "http://pencil.evolus.vn/dl/V$VERSION/Pencil_${VERSION}_$ARCH.deb"

  # Install
  sudo dpkg -i /tmp/pencil.deb
}
