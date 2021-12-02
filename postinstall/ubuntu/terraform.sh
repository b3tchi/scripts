#/bin/bash
sudo apt-get install unzip

version='1.0.11'

wget "https://releases.hashicorp.com/terraform/${version}/terraform_${version}_linux_amd64.zip" -O terraform.zip
unzip terraform.zip
sudo mv terraform /usr/local/bin
rm terraform.zip

terraform -v
