ln -sf /usr/share/zoneinfo/Europe/Sofia /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
# cp /root/archinstall/locale.gen /etc/locale.gen
locale-gen

touch /etc/locale.conf && echo "LANG=en_US.UTF-8" >> /etc/locale.conf
touch /etc/vconsole.conf && echo "KEYMAP=us" >> /etc/vconsole.conf
touch /etc/hostname && echo "name" >> /etc/hostname

echo "root:name" | chpasswd
useradd -m -G wheel -s /bin/bash name
echo "name:name" | chpasswd

touch visudo && echo "%wheel ALL=(ALL:ALL) ALL" >> visudo

su -
usermod -aG wheel name
su name | echo "name" | sudo -S sudo pacman -Syu --noconfirm plasma sddm konsole kate vivaldi

exit

systemctl enable NetworkManager
systemctl enable sddm
grub-install $devDiskDir
grub-mkconfig -o /boot/grub/grub.cfg


exit
umount -a
reboot