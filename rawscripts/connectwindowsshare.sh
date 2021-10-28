#install mount tools
sudo apt-get install cifs-utils

#create mount location
mkdir ~/xorg

#mount location with user important put domain
sudo mount.cifs -o username=czjabeck //czare1.corp.lego.com/files/CrossOrg/ ~/xorg
