#!/bin/bash
# Driven code

BASHRC=$HOME/.bashrc
BASHRC_APPEND=./bashrc-append

# copy sensible
mkdir -p $HOME/.config/bash
cp ./sensible.bash $HOME/.config/bash/

# Append to .bashrc
cat "$BASHRC_APPEND" >> "$BASHRC"

# install packages
chmod +x ./packages/install_packages.sh
bash ./packages/install_packages.sh

# restore desktop settings | https://www.addictivetips.com/ubuntu-linux-tips/back-up-the-gnome-shell-desktop-settings-linux/
dconf load / < ./packages/settings
