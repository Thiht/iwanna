#!/bin/bash

# https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce

set -euo pipefail
IFS=$'\n\t'

pre-install() {
  sudo apt-get update
  sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    software-properties-common

  curl -s https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
}

post-install() {
  sudo groupadd docker
  sudo usermod -aG docker "$USER"
}
