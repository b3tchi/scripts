#!/bin/bash

sdir=$(dirname "$0")
log=$0.log
system='ubuntu'


# OUTPUT-COLORING
red='\e[0;31m'
green='\e[0;32m'
yellow='\e[0;33m'
cyan='\e[0;36m'
NC='\e[0m' # No Color

#echo -e "${green}$1${NC}"
OK="${green}OK${NC}"
WW="${yellow}WW${NC}"
EE="${red}EE${NC}"
II="${cyan}II${NC}"

if [[ $IS_ANDROID -eq 1 ]]; then
  echo switching to termux
  system='termux'
fi
# source "$sdir/install-lib.sh"

if [ ! -f $log ]; then
  # echo "init" >> $log
  touch $log
fi

#make executable all scripts
chmod +x ${sdir}/${system}/*.sh

function deploy {

  step=$1
  # log=$2

  if ! grep -q $step $log; then

    file=${sdir}/${system}/${step}.sh

    if [[ -e $file ]]; then

      #run script
      # $($file)
      source $file

      if [[ $? -eq 0 ]]; then
        echo $step >> $log
        echo -e "$OK - $step"
      else
        echo -e "$EE - $step ... execution failed"
      fi

    else
      echo -e "$WW - $step ... not found - skipping"
    fi
  else

    echo -e "$II - $step ... already installed - skipping"
  fi
}

deploy 'test'
deploy 'zsh'
deploy 'coreapps'
deploy 'bat'
deploy 'lazygit'
deploy 'bitwarden'
deploy 'nvim'
deploy 'nvim-dependencies'
deploy 'nvim-node'
deploy 'nvim-python'
deploy 'nvim-lsp'
