#!/bin/bash

function node-nvm {

  sudo apt-get install -y \
    curl

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | zsh
  source ~/.zshrc

  # nvm list-remote

  #install node latest
  nvm install lts/fermium

  #node -v

  #Update NPM
  npm install -g npm@latest

}


function neovim-appimage {

  #create application
  sudo apt install curl

  mkdir -p ~/Applications/
  cd ~/Applications

  #download neovim application image
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage
  cd -
}

function neovim-lsp {

  #python language server
  python3 -m pip install pyright

  #bash language server
  npm install -g bash-language-server
}

function bitwarden {
  npm install -g @bitwarden/cli
}


