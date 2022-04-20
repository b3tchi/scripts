#!/bin/bash
# PPA was deprecated
# sudo add-apt-repository ppa:lazygit-team/daily
# sudo apt-get update
# sudo apt-get install lazygit

# Download of the binary file
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')

curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"

sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit

lazygit --version

#cleanup
rm -rf lazygit.tar.gz
