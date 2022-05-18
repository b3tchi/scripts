#!/bin/zsh

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
# chmod +x ${sdir}/${system}/*.sh

onetimers=$(ls ${sdir}/${system}/onetime/*.sh | sort)

for val in $(echo $onetimers); do
  deploy $val
done

anytimers=$(ls ${sdir}/${system}/anytime/*.sh | sort)

for val in $(echo $anytimers); do
  deploy $val
done

exit
#
# deploy 'coreapps'
# deploy 'zsh'
# deploy 'bat'
# deploy 'lazygit'
# deploy 'ghcli'
# deploy 'nvim'
# deploy 'nvim-dependencies'
# deploy 'nvim-node'
# deploy 'nvim-lsp'
# deploy 'nvim-python'
# deploy 'bitwarden'
# deploy 'powershell'
# deploy 'syncthing'
# deploy 'docker'

# deploy 'nvim-lsp' will used neovim plugin for auto install
