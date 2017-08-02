# Ubuntu Minimal Installation

This is my personnal script to set up a minimal Ubuntu workstation.

## Requirement

 - Ubuntu installed with the [`minimal image`](https://help.ubuntu.com/community/Installation/MinimalCD)

## Minimal Image Installation

The minimal installation image necessitates a direct internet connection. If your network adapter driver is missing or you are behind a complex proxy, you can use VirtualBox to go through the installation process on a virtual machine. The resulting virtual hard drive image can be converted with:

	$ VBoxManage internalcommands converttoraw VirtualBox/mini/mini.vdi mini.img

This image can be transferred directly to a bootable partition:

	$ sudo dd if=mini.img of=/dev/sdX

## Usage

Once the minimal image is installed, login and run as root:

	$ sudo ./setup.sh
