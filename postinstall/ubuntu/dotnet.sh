#!/bin/bash

#download Microsoft GPG keys
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb

#install Keys
sudo dpkg -i packages-microsoft-prod.deb

#delete package file
rm packages-microsoft-prod.deb

#update repository
sudo apt-get update

#install apt transport
sudo apt-get install -y \
  apt-transport-https

#install dotnet sdk
sudo apt-get install -y \
  dotnet-sdk-6.0
