#!/bin/bash

sdir=$(dirname "$0")
log=$0.log
system='ubuntu'

if [[ $IS_ANDROID -eq 1 ]]; then
  echo switching to termux
  system='termux'
fi

#load deploy function
source "$sdir/install-fxs.sh"

#make executable all scripts
chmod +x ${sdir}/${system}/*.sh

deploy 'test'
deploy 'coreapps'
deploy 'zsh'
deploy 'bat'
deploy 'lazygit'
deploy 'nvim'
deploy 'nvim-dependencies'
deploy 'nvim-node'
deploy 'nvim-python'
deploy 'bitwarden'
deploy 'powershell'
deploy 'syncthing'
# deploy 'nvim-lsp' will used neovim plugin for auto install