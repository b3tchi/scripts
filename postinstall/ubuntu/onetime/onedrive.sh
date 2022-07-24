#!/bin/bash

if [ -f /etc/apt/sources.list.d/onedrive.list ]; then
  # Add the release PGP keys:
  wget -qO - https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_20.04/Release.key | sudo apt-key add -

  # Add the "stable" channel to your APT sources:
  echo 'deb https://download.opensuse.org/repositories/home:/npreining:/debian-ubuntu-onedrive/xUbuntu_20.04/ ./' | sudo tee /etc/apt/sources.list.d/onedrive.list
fi
# Update and install onedrive cli:
sudo apt-get update
sudo apt install onedrive
#there GUI dependency O_o lot of sh*t is coming i want just banana!! not gorilla with jungle
