#!/bin/bash

# If we use 0.20.0:
VERSION='0.20.0'
sudo apt-get install wget
sudo apt-get remove bat

#download bat
wget https://github.com/sharkdp/bat/releases/download/v${VERSION}/bat_${VERSION}_amd64.deb
sudo dpkg -i bat_${VERSION}_amd64.deb

#git adding bat extras
mkdir -p ~/.bat_extras
git clone https://github.com/eth-p/bat-extras ~/.bat_extras

ln -sf ~/.bat_extras/src/batman.sh ~/.local/bin/bman
