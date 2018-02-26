#!/bin/sh
unxz --verbose framework.raw.xz
kpartx -av framework.raw
mkfs.ext4 /dev/mapper/loop0p1
mkfs.vfat /dev/mapper/loop0p2
kpartx -d framework.raw
