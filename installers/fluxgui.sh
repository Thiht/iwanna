#!/bin/bash

# https://github.com/xflux-gui/fluxgui#install-instructions

set -euo pipefail
IFS=$'\n\t'

pre-install() {
  sudo add-apt-repository ppa:nathan-renniewaldock/flux
}
