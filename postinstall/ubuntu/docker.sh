#!/bin/bash

#preparing system
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

#adding repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce

#installing docker
sudo apt install -y docker-ce
# sudo systemctl status docker

#allow current user run docker
sudo usermod -aG docker ${USER}

echo 'to reload user run su - ${USER}'
# su - ${USER}


