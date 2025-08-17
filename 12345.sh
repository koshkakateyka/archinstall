systemctl enable NetworkManager
systemctl enable sddm
grub-install $devDiskDir
grub-mkconfig -o /boot/grub/grub.cfg

# трабла со входами туда-сюда
exit
umount -a
reboot