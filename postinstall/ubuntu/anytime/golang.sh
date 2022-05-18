#!/bin/bash

# VERSION="1.18.1"

LOCAL_VERSION=$(go version | grep -Po 'go version go\K[0-9.]+')
REPO_VERSION=$(curl -s 'https://go.dev/dl/?mode=json' | jq -r '.[0].version'| grep -Po 'go\K[0-9.]+')

if [[ -z $LOCAL_VERSION ]]; then
  ACTION=2
else
  LATEST_VERSION=$(printf "${REPO_VERSION}\n${LOCAL_VERSION}" | sort -rV | head -n1)
  if [[ "$LATEST_VERSION" == "$LOCAL_VERSION" ]]; then
    ACTION=0
    echo "on latest $LOCAL_VERSION"
  else
    ACTION=1
    echo "update $LOCAL_VERSION >> $REPO_VERSION"
  fi
fi

if [[ $ACTION > 0 ]];then


  if [[ $ACTION == 1 ]];then
    sudo rm -rf /usr/local/go
  fi
    wget -c "https://dl.google.com/go/go${REPO_VERSION}.linux-amd64.tar.gz" -O - | sudo tar -xz -C /usr/local

    export PATH=$PATH:/usr/local/go/bin

fi
