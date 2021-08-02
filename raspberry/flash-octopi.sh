#!/bin/bash

# NAME KNAME PATH MAJ:MIN FSAVAIL FSSIZE FSTYPE FSUSED FSUSE% MOUNTPOINT LABEL UUID                                 PTUUID                               PTTYPE PARTTYPE                             PARTLABEL PARTUUID
#            PARTFLAGS                             RA RO RM HOTPLUG MODEL SERIAL   SIZE STATE OWNER GROUP MODE       ALIGNMENT MIN-IO OPT-IO PHY-SEC LOG-SEC ROTA SCHED RQ-SIZE TYPE DISC-ALN DISC-GRAN DISC-MAX DISC-ZERO WSAME WWN
#                              RAND PKNAME HCTL       TRAN   SUBSYSTEMS  REV VENDOR ZONED
# └─mmcblk0p1 mmcblk0p1 /dev/mmcblk0p1 179:1                  vfat                                                             RPI              E7F8-25AC                                                                 dos    0xc
#                                                                                                                                    128  0  0       1                                               940M         root  disk  brw-rw----
#        0    512      0     512     512    0 mq-deadline     128 part  3145728        4M     2.3G         0    0B                                         0 mmcblk0                   block:mmc:mmc_host:platform:pci               none

function listpart() {
  echo $(lsblk -o label,pkname,kname,mountpoint,uuid | grep 'RPI')
}

function preparepartition() {

  # $partition=/dev/mmcblk0p1
  device=/dev/mmcblk0
  partition=/dev/mmcblk0p1

  sudo parted ${device} --script -- mklabel msdos
  sudo parted ${device} --script -- mkpart primary fat32 1MiB 100%

  sudo mkfs.fat -n OCTOPI -F32 ${partition}

}

function octopidownload() {

  # url=https://github.com/guysoft/OctoPi/releases/download/0.18.0/
  # file=octopi-buster-armhf-lite-0.18.0.zip
  url=$1
  file=$2
  folder=./pi_image


  mkdir -p $folder
  # curl -o ./image/ https://github.com/guysoft/OctoPi/releases/download/0.18.0/octopi-buster-armhf-lite-0.18.0.zip
  if [ -f "$folder/$file" ]; then
    echo 'file already exists'
  else
    wget -P ${folder} ${url}${file}
  fi
}

function flashpartition() {

  file=octopi-buster-armhf-lite-0.18.0.zip
  folder=./pi_image

  device=/dev/mmcblk0

  # sudo umount ${partition}

  unzip -p ${folder}/${file} | sudo dd of=${device} bs=32M conv=fsync

  # sudo dd if=${folder}/${file} of=${partition} bs=4M conv=fsync

}

function flashpartition_core() {

  file=ubuntu-core-20-armhf+raspi.img.xz
  folder=./pi_image

  device=/dev/mmcblk0

  # sudo umount ${partition}

  xzcat ${folder}/${file} | sudo dd of=${device} bs=32M
  # sudo dd if=${folder}/${file} of=${partition} bs=4M conv=fsync

}

# listpart
preparepartition

# OctoPi Flash
octopidownload https://github.com/guysoft/OctoPi/releases/download/0.18.0/ octopi-buster-armhf-lite-0.18.0.zip
flashpartition

# Ubuntu core Flash
# octopidownload https://cdimage.ubuntu.com/ubuntu-core/20/stable/current/ ubuntu-core-20-armhf+raspi.img.xz
# flashpartition_core


