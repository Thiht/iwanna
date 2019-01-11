#!/bin/bash

# https://golang.org/doc/install#install

set -euo pipefail
IFS=$'\n\t'

VERSION=1.11.4
OS=linux
ARCH=amd64

cleanup() {
  rm /tmp/go.tar.gz
}

install() {
  # Download archive
  curl -#Lo /tmp/go.tar.gz "https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz"

  # Install
  sudo tar -C /usr/local -xf /tmp/go.tar.gz

  if [[ $PATH != *'/usr/local/go/bin'* ]]; then
    echo 'Adding /usr/local/go/bin to the PATH'
    # shellcheck disable=SC2016
    echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile
  fi

  GOPATH=${GOPATH:-$HOME/go}
  if [ ! -d "$GOPATH" ]; then
    echo "Creating workspace at $GOPATH"
    mkdir -p "$GOPATH"
  fi
}
