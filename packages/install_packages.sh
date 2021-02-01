#!/bin/bash
# Install the packages listed in packages.txt
PKG_TXT="`pwd`/packages/packages.txt"

if [ ! -f $PKG_TXT ]; then
  echo "packages.txt doesn't exist, exiting"
  exit
fi

sudo apt -y update
sudo apt -y upgrade

while IFS= read -r package; do
  sudo apt -y install $package
done <$PKG_TXT
