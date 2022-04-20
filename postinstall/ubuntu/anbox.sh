#!/bin/bash
sudo apt-get update
sudo apt-get install -y \
    dkms \
    android-tools-adb \
    git \
    curl \
    unzip \
    linux-headers-generic

# sudo modprobe ashmem_linux
# sudo modprobe binder_linux

cd ~
git clone https://github.com/anbox/anbox-modules.git

cd ~/anbox-modules
# ./INSTALL.sh
sudo cp anbox.conf /etc/modules-load.d/
sudo cp 99-anbox.rules /lib/udev/rules.d/
#
sudo cp -rT ashmem /usr/src/anbox-ashmem-1
sudo dkms install anbox-ashmem/1
sudo modprobe ashmem_linux
#
sudo cp -rT binder /usr/src/anbox-binder-1
sudo dkms remove anbox-binder --all
sudo dkms add -m anbox-binder -v 1
sudo dkms build -m anbox-binder -v 1
sudo dkms install -m anbox-binder -v 1
sudo modprobe binder-linux
# sudo dkms install anbox-binder/1

sudo modprobe binder_linux
sudo mkdir -p /dev/binder
sudo mount -t binder binder /dev/binder

cd -
rm -rf ~/anbox-modules

