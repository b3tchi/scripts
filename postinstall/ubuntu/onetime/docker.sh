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
    software-properties-common \
    python3 \
    python3-pip \

#adding repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce

#installing docker
sudo apt install -y docker-ce docker-ce-cli containerd.io

#installing docker-compose using pip
python3 -m pip install docker-compose
# sudo systemctl status docker

#ensure user group is there
sudo groupadd docker
#allow current user run docker
sudo usermod -aG docker ${USER}

echo 'to reload user run su - ${USER}'
# su - ${USER}


