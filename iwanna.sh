#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

if (( $# < 1 )); then
  echo "$(tput bold)Available installers$(tput sgr0)"
  find installers/ -type f -exec basename --suffix=.sh -- {} \; | sort
  exit
fi

package=$1
if [ ! -f "installers/$package.sh" ]; then
  echo "$(tput setaf 1)No installer for $package$(tput sgr0)" >&2
  exit 1
fi

# shellcheck disable=SC1090
source "installers/$package.sh"

# shellcheck disable=SC2034
if declare -F check > /dev/null 2>&1; then
  check
elif dpkg -s "$package" > /dev/null 2>&1; then
  echo "$(tput setaf 1)$package is already installed$(tput sgr0)" >&2
  exit 1
fi

# shellcheck disable=SC2034
if declare -F cleanup > /dev/null 2>&1; then
  trap cleanup EXIT
fi

if declare -F pre-install > /dev/null 2>&1; then
  pre-install
fi

# shellcheck disable=SC2034
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
