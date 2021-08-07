#!/bin/bash

#set variables
email=beckaja1@gmail.com
machinename=vm01-ubuntuwsl
suffix=b3

#lead libraries
source ./bitwarden/bwlogin.sh
source ./git/support-fx.sh

#generate ssh
generatessh $email $suffix

#read ssh
ssh=$SSH_PUB

#login bitwarden
bwlogin-prompt

#get ssesion key
seskey=$BW_SESSION

#sync client
bw --session $seskey sync

#get token
pat=$(bw --session $seskey get password github-ssh-pat)

#register current machine to ssh
registergitssh $pat $machinename "$ssh"
