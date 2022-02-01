#!/bin/bash
#ensure removing older packages
sudo apt-get remove docker docker-engine docker.io containerd runc

#preparing system
sudo apt update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    software-properties-common

#adding repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce

#installing docker
sudo apt install -y docker-ce docker-ce-cli containerd.io
# sudo systemctl status docker

#ensure user group is there
sudo groupadd docker
#allow current user run docker
sudo usermod -aG docker ${USER}

echo 'to reload user run su - ${USER}'
# su - ${USER}


