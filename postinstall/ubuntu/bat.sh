#!/bin/bash

# If we use 0.18.0:
VERSION='0.18.0'
sudo apt-get install wget

wget https://github.com/sharkdp/bat/releases/download/v${VERSION}/bat_${VERSION}_amd64.deb
sudo dpkg -i bat_${VERSION}_amd64.deb

