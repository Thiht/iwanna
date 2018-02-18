#!/bin/bash

# https://www.spotify.com/fr/download/linux/

set -euo pipefail
IFS=$'\n\t'

pre-install() {
  curl -s 'https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x0DF731E45CE24F27EEEB1450EFDC8610341D9410' | sudo apt-key add -
  echo 'deb http://repository.spotify.com stable non-free' | sudo tee /etc/apt/sources.list.d/spotify.list
}
