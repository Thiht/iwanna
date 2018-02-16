#!/bin/bash

# https://github.com/horst3180/arc-theme#installation

set -euo pipefail
IFS=$'\n\t'

pre-install() {
  curl -s https://download.opensuse.org/repositories/home:Horst3180/xUbuntu_16.04/Release.key | sudo apt-key add -
  echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_16.04/ /' | sudo tee /etc/apt/sources.list.d/arc-theme.list
}
