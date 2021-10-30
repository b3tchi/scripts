#!/bin/bash

sdir=$(dirname "$0")
log=$0.log
system='ubuntu'

# source "$sdir/install-lib.sh"

if [ ! -f $log ]; then
  echo "init" >> $log
fi

function deploy {

  step=$1
  # log=$2

  if ! grep -q $step $log; then

    $(${sdir}/${system}/${step}.sh)
    # neovim-lsp

    echo $step >> $log
  fi
}

deploy 'test'
