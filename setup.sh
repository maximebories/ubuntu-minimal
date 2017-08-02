#!/bin/bash

# Update
apt-get update
apt-get upgrade

# Unity Desktop
apt-get install ubuntu-desktop --no-install-recommends

# iPhone Tethering
apt-get install usbmuxd

# Network
apt-get install network-manager-gnome --no-install-recommends
# Fix 17.04 NM Bug
touch /etc/NetworkManager/conf.d/10-globally-managed-devices.conf
service network-manager restart

# Browser
apt-get install chromium-browser --no-install-recommends

# Utilities
apt-get install gnome-terminal gnome-screenshot gnome-disk-utility gnome-calculator nautilus-actions bash-completion sshfs gvfs-backends nano --no-install-recommends

# Theme
apt-get install arc-theme --no-install-recommends
apt-get install unity-tweak-tool --no-install-recommends
apt-get install indicator-session --no-install-recommends
apt-get install hud --no-install-recommends
apt-get install unity-lens-* --no-install-recommends

# Icons
add-apt-repository ppa:numix/ppa
apt-get update
apt-get install numix-icon-theme-circle
cp ubuntu.png /usr/share/unity/icons/launcher_bfb.png

# Software
apt-get install gedit --no-install-recommends

# Work
#apt-get install build-essential git octave octave-signal --no-install-recommends
