#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

VERSION=1.1.1
HASH=c93c6b0
OS=linux
ARCH=x86_64

_troubleshooting=$(cat <<END
$(tput bold)Troubleshooting$(tput sgr0)
Issue
    Error message: This application failed to start because it could not find or load the Qt platform plugin "xcb" in "".
See
    https://github.com/Studio3T/robomongo/issues/1385
Fix
    rm /opt/robo3t-$VERSION-$OS-$ARCH-$HASH/lib/libstdc++*
END
)

cleanup() {
  rm /tmp/robo3t.tar.gz
}

install() {
  # Download archive
  curl -#Lo /tmp/robo3t.tar.gz "https://download.robomongo.org/$VERSION/linux/robo3t-$VERSION-$OS-$ARCH-$HASH.tar.gz"

  # Install
  sudo tar -C /opt -xf /tmp/robo3t.tar.gz
  sudo ln -s "/opt/robo3t-$VERSION-$OS-$ARCH-$HASH/bin/robo3t" /usr/bin/robo3t

  # Custom
  echo "$_troubleshooting"
}
