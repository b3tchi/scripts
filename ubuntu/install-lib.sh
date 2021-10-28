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
function nvim-lsp{
  python3 -m pip install pyright
  npm install -g bash-language-server
}

function bitwarden {
  npm install -g @bitwarden/cli
}


