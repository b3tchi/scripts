#!/bin/bash
# path=//czare1.corp.lego.com/files/CrossOrg/
path=//czare1.corp.lego.com/files/CrossOrg/
path=//czasql-901.corp.lego.com/SQLBackups/SMCD_KLA_FollowUp_BE_Prodcopy/Full/

mountpoint=~/xorg
username=czjabeck

#check if needed to install mount tools
if [[ "$(dpkg -l | awk '/cifs-utils/ {print }'|wc -l)" -ge 1 ]]; then
  echo "cifs-utils already installed"
else
  sudo apt-get install cifs-utils
fi

#create mount location
if [[ ! -d $mountpoint ]]; then
  echo "creating mount point ${mountpoint}"
  mkdir ${mountpoint}
fi

#mount location with user important put domain
# sudo mount.cifs -o username=czjabeck ${path} ${mountpoint}
# read -s -p "drive password" xpwd

xpwd=$(pass show lego/userpass)

# echo $xpwd
sudo mount -t cifs -o "username=${username},password=${xpwd}" ${path} ${mountpoint}
