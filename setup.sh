#!/bin/bash

BASHRC=$HOME/.bashrc
BASHRC_APPEND=./bashrc-append

echo "Setting up bash"

# Copy sensible
mkdir -p $HOME/.config/bash
cp ./sensible.bash $HOME/.config/bash/

# Append to .bashrc
cat "$BASHRC_APPEND" >> "$BASHRC"

# Add new commands
echo "Setting up commands"
cp ./commands/calc $HOME/.local/bin/
cp ./commands/cmd $HOME/.local/bin/

# Enable flatpak
echo "Enabling flatpak"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Enable RPM Fusion
echo "Enabling RPMFusion"
# Free
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
# Non-Free
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Vscodium
echo "Adding vscodium to dnf"
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo

sudo dnf update --refresh

# Installing packages using flatpak
echo "Installing flatpak packages"
flatpak install easyeffects
flatpak install jstest-gtk
flatpak install teamspeak
flatpak install discord
flatpak install spotify
flatpak install joplin
flatpak install drawio
flatpak install openboard

# Installing packages using dnf
echo "Installing dnf packages"
sudo dnf install gnome-tweaks
sudo dnf install steam
sudo dnf install obs-studio
sudo dnf install gimp
sudo dnf install qbittorrent
sudo dnf install git
sudo dnf install gcc
sudo dnf install cmake
sudo dnf install python3
sudo dnf install python3-pip
sudo dnf install codium
sudo dnf install vim
sudo dnf install gnome-extensions-app

echo "After install scripts"

echo "Writting vscodium product.json"
touch $HOME/.config/VSCodium/product.json
tee -a .$HOME/.config/VSCodium/product.json << END
{
  "extensionsGallery": {
    "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
    "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
    "itemUrl": "https://marketplace.visualstudio.com/items",
    "controlUrl": "",
    "recommendationsUrl": ""
  }
}
END

echo "Fixing mouse acceleration and DPI"
gsettings set org.gnome.desktop.peripherals.mouse accel-profile flat
gsettings get org.gnome.desktop.peripherals.mouse accel-profile

echo "Restoring custom shortcuts"
dconf load /org/gnome/desktop/wm/keybindings/ < shortcuts/wm-keybindings.dconf.bak
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < shortcuts/media-keys-keybindings.dconf.bak

echo "Remember to install: insync, Synergy, Tibia, Chrome"
echo "Also read the readme file"
