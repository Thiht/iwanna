#!/bin/bash

# https://www.jetbrains.com/toolbox/app/

set -euo pipefail
IFS=$'\n\t'

VERSION=1.8.3678

cleanup() {
  rm /tmp/jetbrains-toolbox.tar.gz
}

install() {
  # Download archive
  curl -#Lo /tmp/jetbrains-toolbox.tar.gz "https://download.jetbrains.com/toolbox/jetbrains-toolbox-$VERSION.tar.gz"

  # Install
  sudo tar -C /opt -xf /tmp/jetbrains-toolbox.tar.gz
  sudo ln -s "/opt/jetbrains-toolbox-$VERSION/jetbrains-toolbox" /usr/bin/jetbrains-toolbox
}
