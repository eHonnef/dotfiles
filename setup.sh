#!/bin/bash

BASHRC=$HOME/.bashrc

# Setup the sensible bash
source $PWD/modules/setup-sensible-bash.bash
# Setup the custom commands
source $PWD/modules/custom-commands.bash

# Append to .bashrc to source bashrc-source-me.bash
echo "source $HOME/.config/bash/bashrc-source-me.bash" >> "$BASHRC"

# Enable flatpak
echo "Enabling flatpak"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Enable RPM Fusion
# echo "Enabling RPMFusion"
# Free
# $DNF_INSTALL https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
# Non-Free
# $DNF_INSTALL https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Vscodium
# echo "Adding vscodium to dnf"
# sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
# printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo

sudo dnf update --refresh

# Installing packages using flatpak
echo "Installing flatpak packages"
FL_INSTALL="flatpak -y install"
#$FL_INSTALL easyeffects
#$FL_INSTALL jstest-gtk
$FL_INSTALL teamspeak
$FL_INSTALL discord
$FL_INSTALL spotify
$FL_INSTALL joplin
$FL_INSTALL drawio
$FL_INSTALL brave
#$FL_INSTALL openboard

# Installing packages using dnf
echo "Installing dnf packages"
DNF_INSTALL="sudo dnf -y install"
#$DNF_INSTALL gnome-tweaks
$DNF_INSTALL steam
#$DNF_INSTALL obs-studio
$DNF_INSTALL gimp
$DNF_INSTALL qbittorrent
$DNF_INSTALL git
$DNF_INSTALL git-gui
$DNF_INSTALL gcc
$DNF_INSTALL cmake
$DNF_INSTALL python3
$DNF_INSTALL python3-pip
# $DNF_INSTALL codium
$DNF_INSTALL vim
$DNF_INSTALL rclone
$DNF_INSTALL libheif
#$DNF_INSTALL rust
#$DNF_INSTALL gnome-extensions-app
$DNF_INSTALL vlc
#$DNF_INSTALL gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
#$DNF_INSTALL lame\* --exclude=lame-devel

$DNF_INSTALL https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm

# echo "After install scripts"

# echo "Writting vscodium product.json"
# CODIUM_PATH=$HOME/.config/VSCodium
# if [ ! -f "$CODIUM_PATH/product.json" ]; then
#   mkdir -p $HOME/.config/VSCodium/
#   touch $HOME/.config/VSCodium/product.json

#   printf "{\"extensionsGallery\":{\"serviceUrl\": \"https://marketplace.visualstudio.com/_apis/public/gallery\",\"cacheUrl\": \"https://vscode.blob.core.windows.net/gallery/index\",\"itemUrl\": \"https://marketplace.visualstudio.com/items\",\"controlUrl\": \"\"}}" >> $HOME/.config/VSCodium/product.json
# fi

echo "Fixing mouse acceleration and DPI"
#gsettings set org.gnome.desktop.peripherals.mouse accel-profile flat
#gsettings get org.gnome.desktop.peripherals.mouse accel-profile

echo "Restoring custom shortcuts"
#dconf load /org/gnome/desktop/wm/keybindings/ < shortcuts/wm-keybindings.dconf.bak
#dconf load /org/gnome/settings-daemon/plugins/media-keys/ < shortcuts/media-keys-keybindings.dconf.bak

echo "Remember to install: insync, Synergy, Tibia, brave, clion...."
echo "Also read the readme file"
