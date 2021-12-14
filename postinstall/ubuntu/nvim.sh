#!/bin/bash

sudo apt install -y \
  neovim \
  curl \

[[ -f ~/Applications/nvim.appimage ]] && rm ~/Applications/nvim.appimage
[[ -d ~/Applications/neovim ]] && rm -rf ~/Applications/neovim

mkdir -p ~/Applications/neovim
cd ~/Applications/neovim

#download neovim application image
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage

#executable
chmod u+x nvim.appimage

#extract
./nvim.appimage --appimage-extract

cd -
