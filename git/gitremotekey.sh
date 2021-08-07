#!/bin/bash
# . ./../config.sh


function registergitssh {

  pat=$1
  title=$2
  sshkey=$3

  # pat="e50df4d8a8f369a4885229a77a4bdb0efdec357a"
  # title="DevVm_`date +%Y%m%d%H%M%S`"
  # sshkey="`cat ~/.ssh/\"$Gfilegit\".pub`"

  echo $pat
  echo $title
  echo $sshkey

  # actual way (2020)
  curl -h "authorization: token $pat" \
    --data "{\"title\":\"$title\",\"key\":\"$sshkey\"}" \
    https://api.github.com/user/keys

  # old way till (2020)
  # curl -u "b3tchi" \
  #   --data "{\"title\":\"devvm_`date +%y%m%d%h%m%s`\",\"key\":\"`cat ~/.ssh/id_rsa_git.pub`\"}" \
  #   https://api.github.com/user/keys

}

function generatessh {
  email=$1
  sshsuffx=$2

  ssh-keygen -t rsa -b 4096 -C $email

}

function addnum {
  echo $(( $1 + $2 ))
}
