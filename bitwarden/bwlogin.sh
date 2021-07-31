#!/bin/bash

function bwlogin-prompt {

  a=$(bw logout)

  if [ -z "${BW_EMAIL}" ]; then
    echo "Enter your email:"
    read loginm
  else

    echo "Enter your email [$BW_EMAIL]:"
    read loginm

    if [ -z $loginm ]; then
      loginm=$BW_EMAIL
    fi
  fi


  if [ -z "${BW_MKEY}" ]; then
    echo "Enter your masterkey:"
    read loginp
  else

    echo "Enter your masterkey [LastUsed]:"
    read -s loginp

    if [ -z $loginp ]; then
      loginp=$BW_MKEY
    fi
  fi

  echo "Enter your authenticator code:"
  read loginc

  #Temporarly Export Login and Password
  export BW_EMAIL=$loginm
  export BW_MKEY=$loginp

  bwlogin $loginm $loginp $loginc

  # bw --session $BW_SESSION get password github-pat

}

function bwlogin {

  loginm=$1
  loginp=$2
  loginc=$3

  a=$(bw login $loginm $loginp --method 0 --code $loginc)

  # echo 'out'
  # echo $a
  #
  # echo 'bprop'
  # echo "$a" > test.txt
  b=$(echo $a | grep -Po '(?<=export BW_SESSION=")[^\"]+')
  #regex take item between 'export BW_SESSION="'  and  '"'

  export BW_SESSION="$b"

  # echo $BW_SESSION

  #TBD check when failiure

}


