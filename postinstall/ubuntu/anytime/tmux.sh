#!/bin/bash

repo="tmux/tmux"

LOCAL_VERSION=$(tmux -V | grep -Po 'tmux \K[0-9.a]+')
REPO_VERSION=$(curl -s "https://api.github.com/repos/${repo}/releases/latest" | grep -Po '"tag_name": "\K[0-9.a]+')
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

# exit 0
# If we use 0.20.0:
# VERSION='0.20.0'
if [[ $ACTION > 0 ]];then
  if [[ $ACTION == 1 ]];then
    # sudo apt-get remove bat
    # rm -rf ~/.bat_extras
    echo 'remove tbd'
  fi

  #get wget
  sudo apt-get install wget
  sudo apt-get install -y \
    libevent-dev \
    ncurses-dev \
    build-essential \
    bison \
    pkg-config

  #download bat
  mkdir -p ~/Applications/tmux
  cd ~/Applications/tmux
  wget https://github.com/${repo}/releases/download/${LATEST_VERSION}/tmux-${LATEST_VERSION}.tar.gz
tar -zxf tmux-${LATEST_VERSION}.tar.gz
cd tmux-${LATEST_VERSION}/
./configure
make
sudo make install
  # sudo dpkg -i bat_${LATEST_VERSION}_amd64.deb
  # rm bat_${LATEST_VERSION}_amd64.deb

  #git adding bat extras
  # git clone https://github.com/eth-p/bat-extras ~/.bat_extras

  # ln -sf ~/.bat_extras/src/batman.sh ~/.local/bin/bman
fi
