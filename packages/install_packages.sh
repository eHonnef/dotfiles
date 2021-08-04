#!/bin/bash
# Install the packages listed in packages
PKG_TXT="`pwd`/packages/packages"

if [ ! -f $PKG_TXT ]; then
  echo "packages doesn't exist, exiting"
  exit
fi

sudo dnf update

while IFS= read -r package; do
  sudo dnf install $package
done <$PKG_TXT
