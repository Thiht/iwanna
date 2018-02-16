#!/bin/bash

# https://www.sublimetext.com/docs/3/linux_repositories.html

set -euo pipefail
IFS=$'\n\t'

pre-install() {
  sudo apt-get update
  sudo apt-get install apt-transport-https

  curl -s https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  echo 'deb https://download.sublimetext.com/ apt/stable/' | sudo tee /etc/apt/sources.list.d/sublime-text.list
}
