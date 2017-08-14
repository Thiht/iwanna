#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if [ $# -lt 1 ]; then
  echo "$(tput bold)Available installers$(tput sgr0)"
  ls installers/
  exit
fi

package=$1
if [ ! -f installers/"$package" ]; then
  echo "$(tput setaf 1)No installer for $package$(tput sgr0)" >&2
  exit 1
fi

source installers/"$package"

if declare -F check > /dev/null 2>&1; then
  check
elif dpkg -s "$package" > /dev/null 2>&1; then
  echo "$(tput setaf 1)$package is already installed$(tput sgr0)" >&2
  exit 1
fi

if declare -F pre-install > /dev/null 2>&1; then
  pre-install
fi

if declare -F install > /dev/null 2>&1; then
  install
else
  sudo apt-get update
  sudo apt-get install -y "$package"
fi

if declare -F post-install > /dev/null 2>&1; then
  post-install
fi

echo "$(tput setaf 2)$package installed successfully$(tput sgr0)"
