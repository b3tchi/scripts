#!/bin/bash

sudo apt install -y \
  neovim \
  curl \

mkdir -p ~/Applications/
cd ~/Applications

[[ -f ~/Applications/nvim.appimage ]] && rm ~/Applications/nvim.appimage

#download neovim application image
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
cd -
