#!/bin/bash

echo 'ping archlinux.org'
echo 'sudo pacman -Syu git'

echo 'перед началом, разметье диск, через fdisk или cfdisk(намного лучше) команду'
echo 'как того как вы разметили всё, можете вернуться обратно сюда, а сейчас'
echo 'напишите сюда свой основной раздел, где будет арч-линукс, например, через lsblk'
echo 'у вас выходит такое:'
echo '[slava@slava ~]$ lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda           8:0    1  14.4G  0 disk 
├─sda1        8:1    1  14.4G  0 part 
└─sda2        8:2    1    32M  0 part 
nvme0n1     259:0    0   1.8T  0 disk 
├─nvme0n1p1 259:1    0   100M  0 part 
├─nvme0n1p2 259:2    0    16M  0 part 
├─nvme0n1p3 259:3    0   1.3T  0 part 
├─nvme0n1p4 259:4    0   707M  0 part 
├─nvme0n1p5 259:5    0     1G  0 part 
├─nvme0n1p6 259:6    0    32G  0 part 
├─nvme0n1p7 259:7    0 467.6G  0 part 
└─nvme0n1p8 259:8    0   546M  0 part '
echo 'в моём случае /dev/nvme0n1p7'
echo 'значит пишите: /dev/nvme0n1p7 сейчас'


# сделаете это, затем пишите свой основной диск, где будет установлен линукс арч'
# echo ''

# echo "write 'lsblk', then, here the path, something like this:" 
# echo "'/dev/nvme0n1p' or '/dev/sda', and you need this pass for the future"
# echo "now, exit, and"
read main
echo "main: $main"

echo "затем напишите сюда путь под swap:"
read swap
echo "swap: $swap"

echo "затем напишите место под boot/efi:"
read efi
echo "efi: $efi"

echo "auto install arch:"
echo "main: $main"
echo "swap: $swap"
echo "efi: $efi"
echo "progress..."

mkfs.ext4 $main
mkswap $swap
mkfs.fat -F 32 $efi

mount $main /mnt
swapon $swap
mkdir -p /mnt/boot/efi
mount $efi /mnt/boot/efi

pacstrap /mnt base linux linux-firmware sof-firmware base-devel grub efibootmgr nano networkmanager

date