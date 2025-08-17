systemctl enable NetworkManager
systemctl enable sddm
grub-install $devDiskDir
grub-mkconfig -o /boot/grub/grub.cfg


exit
umount -a
reboot