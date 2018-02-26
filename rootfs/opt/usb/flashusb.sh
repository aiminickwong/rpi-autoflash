#!/bin/sh
echo "Checking devices......."
d=$(ls /dev | grep sd | grep -v -E '1|2|3|4|5|6|7|8|9|0')
fdisk -l /dev/$d
i=$(cat /boot/dload/imginfo.txt)
fdisk -l /boot/dload/$i
echo "Flashing Image........."
ddrescue -D --force /boot/dload/$i /dev/$d
echo "Success....."
echo "Reboot,Please Wait........"
