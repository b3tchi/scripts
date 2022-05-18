#!/bin/bash

repo="hashicorp/terraform"

LOCAL_VERSION=$(terraform --version | grep -Po 'Terraform v\K[0-9.]+')
REPO_VERSION=$(curl -s "https://api.github.com/repos/${repo}/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
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
    sudo rm /usr/local/bin/terraform
  fi
  [ -z "$(find -H /var/lib/apt/lists -maxdepth 0 -mtime -7)" ] && sudo apt-get update
  sudo apt-get install wget unzip -y
  sudo wget https://releases.hashicorp.com/terraform/${REPO_VERSION}/terraform_${REPO_VERSION}_linux_amd64.zip
  sudo unzip terraform_${REPO_VERSION}_linux_amd64.zip
  sudo mv terraform /usr/local/bin/

  rm terraform_${REPO_VERSION}_linux_amd64.zip
fi
