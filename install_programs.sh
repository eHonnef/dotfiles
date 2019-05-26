#!/bin/bash
# Install the default packages and programs.

if hash pacman 2>/dev/null; then
  MANAGER="pacman"
  SNAP_MANAGER="snap"
  sudo $MANAGER -Syyu
else
  echo "No package manager found."
  exit 1
fi

# Native packages.
# pacman -Qqettn > packages.txt
PACKAGES="./Packages/packages.txt"
while IFS= read -r package; do
  sudo $MANAGER -S --noconfirm $package
done <"$PACKAGES"

# Enabling snapd.
sudo systemctl enable --now snapd.socket

# Classic snap support, needed to install vscode.
sudo ln -s /var/lib/snapd/snap /snap

PACKAGES="./Packages/snapPackages.txt"
while IFS= read -r package; do
  sudo $SNAP_MANAGER install $package
done <"$PACKAGES"

# Installing python packages.
# pip3 freeze > pipPackages.txt
python3 -m pip install --upgrade pip
pip3 install --user -r pipPackages.txt --upgrade
python3 -m pip_review --local --interactive

# Installing vscode settings sync
code --install-extension shan.code-settings-sync --force
echo "Use this gist: https://gist.github.com/eHonnef/aaea5b529451bf067ce3b854e17d0428"

# AUR packages.
# pacman -Qqettm > AURpackages.txt
PACKAGES="./Packages/AURpackages.txt"
while IFS= read -r package; do
  # git clone $package
  # FOLDER="${package##*/}"
  # FOLDER="${FOLDER%.*}"
  pacaur -S --noconfirm --noedit --needed $package
done <"$PACKAGES"

# Onedrive should be installed by hand
git clone https://github.com/abraunegg/onedrive.git
cd onedrive
./configure --enable-notifications --enable-completions --enable-logging
make clean
make
sudo make install
cd ..
