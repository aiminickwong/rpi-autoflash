#!/bin/sh
echo 'Checking SD Card Devices.......'
sd=$(ls /dev | grep sd | grep -v -E '1|2|3|4|5|6|7|8|9|0')
echo -n "Which Devices You Want To Build? ($sd)"
read d
#ddrescue -D --force framework.raw /dev/$d
fdisk -l /dev/$d
echo -n 'Is this right? (yes/no)'
read q
if [ $q = "yes" ];then
  ddrescue -D --force framework.raw /dev/$d
else
  echo "stop"
  exit
fi
parted -s /dev/$d -- resizepart 2 100%
mkdir mount
mkdir mount/boot
mkdir mount/rootfs
d1=$(ls /dev | grep $d | grep 2)
mkfs.vfat /dev/$d1
mount /dev/$d1 mount/boot
cp -rfp boot/* mount/boot
umount mount/boot
d2=$(ls /dev | grep $d | grep 1)
mount /dev/$d2 mount/rootfs
cp -rfp rootfs/* mount/rootfs
umount mount/rootfs
rm -rf mount
parted -s /dev/$d -- toggle 2 lba
parted -s /dev/$d -- toggle 2 boot
echo 'Succeess!'
