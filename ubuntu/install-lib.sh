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


function neovim-dependencies {

  #telescope
  sudo apt install fd

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

  #css,html,json,javascript language server
  npm i -g vscode-langservers-extracted

  #typescript
  npm install -g typescript typescript-language

  #docker language server
  npm install -g dockerfile-language-server-nodejs

  #vimi
  npm install -g vim-language-server

  #TODO lua

  #TODO omnisharp

  #Terafform
  curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash


}

function bitwarden {
  npm install -g @bitwarden/cli
}


