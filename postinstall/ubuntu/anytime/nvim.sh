#!/bin/bash

repo="neovim/neovim"
location="Applications/neovim"

REPO_VERSION=$(curl -s "https://api.github.com/repos/${repo}/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
LOCAL_VERSION=$(echo $(~/${location}/squashfs-root/AppRun --version) | grep -Po 'NVIM v\K[0-9.]+')
NEWER_VERSION=$(printf "${REPO_VERSION}\n${LOCAL_VERSION}" | sort -rV | head -n1)

if [[ "$NEWER_VERSION" == "$LOCAL_VERSION" ]]; then
  echo same version skipping
  exit
else
  echo "repo $REPO_VERSION"
  echo "local $LOCAL_VERSION"
fi

sudo apt install -y \
  neovim \
  curl \

[[ -f ~/Applications/nvim.appimage ]] && rm ~/Applications/nvim.appimage
[[ -d ~/Applications/neovim ]] && rm -rf ~/$location

mkdir -p ~/$location
cd ~/$location

#download neovim application image
curl -LO "https://github.com/${repo}/releases/latest/download/nvim.appimage"

#executable
chmod u+x nvim.appimage

#extract
./nvim.appimage --appimage-extract

cd -
