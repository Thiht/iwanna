#!/bin/bash

# https://code.visualstudio.com/docs/setup/linux#_installation

set -euo pipefail
IFS=$'\n\t'

pre-install() {
  curl -s https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
  echo 'deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main' | sudo tee /etc/apt/sources.list.d/vscode.list
}
