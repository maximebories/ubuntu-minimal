#!/bin/bash

# Save script directory
psd=$(pwd)

# Update
apt-get update
apt-get upgrade

# Update to Daily
apt-get install update-manager-core
do-release-upgrade --devel-release

# Gnome
apt-get install ubuntu-desktop --no-install-recommends

# iPhone Tethering
apt-get install usbmuxd

# Network
apt-get install network-manager-gnome --no-install-recommends
# Fix management and DNS bugs
touch /etc/NetworkManager/conf.d/10-globally-managed-devices.conf
echo "nameserver 8.8.8.8" | tee /etc/resolvconf/resolv.conf.d/base
service network-manager restart

# Browser
apt-get install chromium-browser --no-install-recommends

# Gnome utilities
apt-get install gnome-terminal gnome-screenshot gnome-disk-utility gnome-calculator gnome-system-monitor gnome-tweak-tool gnome-sushi --no-install-recommends

# Terminal utilities
apt-get install bash-completion wget --no-install-recommends

# Nautilus SFTP support
apt-get install gvfs-backends --no-install-recommends

# Graphic drivers
add-apt-repository ppa:graphics-drivers/ppa --yes
apt-get update
apt-get install nvidia-384 --no-install-recommends

# Work
apt-get install gedit gcc g++ make git octave octave-signal --no-install-recommends

# Theme
cd /tmp &&
wget https://github.com/godlyranchdressing/United-GNOME/raw/master/United-Latest.tar.gz &&
tar xvfz United-Latest.tar.gz &&
mkdir -p ~/.themes && cp -r "United-Ubuntu-Darker" ~/.themes &&
gsettings set org.gnome.desktop.interface gtk-theme "United-Ubuntu-Darker"

# Icons
cd /tmp && rm -fr numix-icon-theme-circle &&
git clone https://github.com/numixproject/numix-icon-theme-circle &&
mkdir -p ~/.icons && cp -r "numix-icon-theme-circle/Numix-Circle" ~/.icons &&
gsettings set org.gnome.desktop.interface icon-theme "Numix-Circle"

# Folders
cd /tmp && rm -fr numix-folders &&
git clone https://github.com/numixproject/numix-folders &&
cd numix-folders && cp -r $psd/numix-folders ~/.config &&
./numix-folders --prev --cli

# Fonts
cd /tmp && rm -fr Overpass &&
git clone https://github.com/RedHatBrand/Overpass &&
mkdir -p ~/.fonts && cp -r "Overpass/desktop-fonts" ~/.fonts &&
gsettings set org.gnome.desktop.interface monospace-font-name 'Overpass Mono 11'
gsettings set org.gnome.desktop.interface font-name 'Overpass 11'
gsettings set org.gnome.desktop.interface document-font-name 'Overpass Light 11'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'Overpass Semi-Bold 11'

# Interface
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,appmenu:'
gsettings set org.gnome.desktop.interface enable-animations false

# Wallpaper
gsettings set org.gnome.desktop.background primary-color '#F4F4F4'
gsettings set org.gnome.desktop.background secondary-color '#F4F4F4'

