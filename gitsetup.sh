#!/bin/bash

#set variables
machinename=lg02ubwl

emailb3=beckaja1@gmail.com
suffixb3=b3

emaillego=janbecka@lego.com
suffixlego=lego

#lead libraries
source ./bitwarden/bwlogin.sh
source ./git/support-fx.sh

#generate ssh
generatessh $emaillego $suffixlego
generatessh $emailb3 $suffixb3

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
