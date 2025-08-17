ln -sf /usr/share/zoneinfo/Europe/Sofia /etc/localtime
hwclock --systohc

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
# cp /root/archinstall/locale.gen /etc/locale.gen
locale-gen

echo "hello world1"

touch /etc/locale.conf && echo "LANG=en_US.UTF-8" >> /etc/locale.conf
touch /etc/vconsole.conf && echo "KEYMAP=us" >> /etc/vconsole.conf
touch /etc/hostname && echo "name" >> /etc/hostname

echo "hello world2"

echo "root:name" | chpasswd
useradd -m -G wheel -s /bin/bash name
echo "name:name" | chpasswd

echo "hello world3"

touch visudo && echo "%wheel ALL=(ALL:ALL) ALL" >> visudo

echo "hello world4"

echo "hello world5"
usermod -aG wheel name
echo "hello world6"

su name | echo "name" | sudo -S sudo pacman -Syu --noconfirm plasma sddm konsole kate vivaldi
# трабла с командой, echo не работает
echo "hello world7"

# трабла со входами туда-сюда
exit

