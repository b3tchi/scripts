#!/bin/bash

repo="sharkdp/bat"

LOCAL_VERSION=$(bat --version | grep -Po 'bat \K[0-9.]+')
REPO_VERSION=$(curl -s "https://api.github.com/repos/${repo}/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
if [[ -z $LOCAL_VERSION ]]; then
  ACTION=2
else
  LATEST_VERSION=$(printf "${REPO_VERSION}\n${LOCAL_VERSION}" | sort -rV | head -n1)
  if [[ "$LATEST_VERSION" == "$LOCAL_VERSION" ]]; then
    ACTION=0
    echo "on latest $LOCAL_VERSION"
  else
    ACTION=1
    echo "update $LOCAL_VERSION >> $REPO_VERSION"
  fi
fi

# If we use 0.20.0:
if [[ $ACTION > 0 ]];then
  if [[ $ACTION == 1 ]];then
    sudo apt-get remove bat
    rm -rf ~/.bat_extras
  fi
sudo apt-get install wget

#download bat
wget https://github.com/${repo}/releases/download/v${LATEST_VERSION}/bat_${LATEST_VERSION}_amd64.deb
sudo dpkg -i bat_${LATEST_VERSION}_amd64.deb
rm bat_${LATEST_VERSION}_amd64.deb

#git adding bat extras
mkdir -p ~/.bat_extras
git clone https://github.com/eth-p/bat-extras ~/.bat_extras

ln -sf ~/.bat_extras/src/batman.sh ~/.local/bin/bman
fi
