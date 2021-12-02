#!/bin/bash

sdir=$(dirname "$0")
log=$0.log
system='ubuntu'

if [[ $IS_ANDROID -eq 1 ]]; then
  echo not possible in termux
  exit 0
fi

#load deploy function
source "$sdir/install-fxs.sh"

#make executable all scripts
chmod +x ${sdir}/${system}/*.sh

deploy 'test'
deploy 'powershell'
deploy 'dotnet'
deploy 'sqlcmd'
deploy 'azcli'
deploy 'roundhouse'

