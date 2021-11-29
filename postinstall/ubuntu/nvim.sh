#!/bin/bash

sudo apt install -y \
  neovim \
  curl \

mkdir -p ~/Applications/
cd ~/Applications

#download neovim application image
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
cd -
