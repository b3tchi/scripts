#INSTALLING OPENSSL 1.1.1h

mkdir ~/updatessl
cd ~/updatessl

wget https://www.openssl.org/source/openssl-1.1.1h.tar.gz
tar -zxf openssl-1.1.1h.tar.gz
cd openssl-1.1.1h
./config

# install dependencies if you not did before
sudo apt-get install make gcc
sudo make install

#archiving current version
sudo mv /usr/bin/openssl /usr/bin/openssl-1.1.1f

#create symlink to new openssl (if already exists delete it)
sudo ln -s /usr/local/bin/openssl /usr/bin/openssl

# update symlinks
sudo ldconfig

# run verification
$ openssl version
# OpenSSL 1.1.1h  22 Sep 2020

#FIX PART TO CERTIFACATES
cd /usr/local/ssl

sudo mv certs certs.original
sudo ln -s /etc/ssl/certs

sudo mv private private.original
sudo ln -s /etc/ssl/private

sudo mv openssl.cnf openssl.cnf.original
sudo ln -s /etc/ssl/openssl.cnf
