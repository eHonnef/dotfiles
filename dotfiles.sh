#!/bin/bash
# Write/substitute the user configuration files

# Removing cp alias for this session to avoid the confirming of overwriting
unalias cp

# Doing by hand
# Home items
cp -f ./files/.bashrc $HOME/.bashrc
cp -f ./files/.dir_colors $HOME/.dir_colors
cp -f ./files/.gitconfig $HOME/.gitconfig
cp -f ./files/.gtkrc-2.0 $HOME/.gtkrc-2.0
cp -f ./files/.profile $HOME/.profile

# .config items
cp -f ./files/.config/autostart/* $HOME/.config/autostart/
cp -f ./files/.config/bash $HOME/.config/bash
cp -f ./files/.config/khotkeysrc $HOME/.config/khotkeysrc
cp -f ./files/.config/htop/htprc $HOME/.config/htop/htprc
cp -f ./files/.config/user-dirs.dirs $HOME/.config/user-dirs.dirs

# Onedrive
mkdir $HOME/OneDrive
mkdir $HOME/.config/onedrive
cp -f ./files/.config/onedrive/* $HOME/.config/onedrive/

# .local items
cp -f ./files/.local/share/konsole/default.keytab $HOME/.local/share/konsole/default.keytab
cp -f ./files/.local/share/konsole/Monokai.colorscheme $HOME/.local/share/konsole/Monokai.colorscheme
cp -f ./files/.local/share/konsole/Shell.profile $HOME/.local/share/konsole/Shell.profile

# .ssh items
mkdir $HOME/.ssh
cp -f ./files/.ssh/config $HOME/.ssh/config
