#!/bin/bash
set -e
##################################################################################################################
# Author 	: 	Marco Obaid
# GitHub    :   https://github.com/marcoobaid
##################################################################################################################
#
#   Main Script to run post Arcolinux install to install/configure applications and settings
#
##################################################################################################################


echo "################################################################"
echo "####                INSTALLING APPS                       ######"
echo "################################################################"

### Fun stuff
sudo pacman -S asciiquarium --noconfirm --needed
sudo pacman -S cool-retro-term --noconfirm --needed
sudo pacman -S cowfortune --noconfirm --needed
sudo pacman -S figlet --noconfirm --needed
sudo pacman -S lolcat --noconfirm --needed

###sudo pacman -S boxes --noconfirm --needed
###sh scripts/install-edex-ui-v*.sh
sh scripts/install-hack-font-v*.sh
sh scripts/install-nerdfonts-v*.sh

### Graphics
sudo pacman -S blender --noconfirm --needed
sudo pacman -S flameshot --noconfirm --needed

### Tools 
sudo pacman -S mc --noconfirm --needed
sudo pacman -S ranger --noconfirm --needed
sudo pacman -S sl --noconfirm --needed
sudo pacman -S ufetch-arco-git --noconfirm --needed
sudo pacman -S youtube-dl --noconfirm --needed
sudo pacman -S leafpad --noconfirm --needed
sh scripts/install-gotop-v*.sh
sh scripts/install-tmatrix-v*.sh
sh scripts/install-cmatrix-v*.sh
sh scripts/install-tty-clock-v*.sh
sh scripts/install-curseradio-v*.sh
sh scripts/install-nemo-v*.sh
sh scripts/install-caffeine-ng-v*.sh
###sh scripts/install-polybar-v*.sh
sh scripts/install-woeusb-v*.sh

### System
###sudo pacman -S qt5ct --noconfirm --needed
sudo pacman -S expac --noconfirm --needed
sudo pacman -S linux-headers --noconfirm --needed

### Virtualbox
sh scripts/install-virtualbox-host-v*.sh
#sudo pacman -S virtualbox-guest-modules-arch --noconfirm --needed

### QEMU/KVM
###sh scripts/install-qemu-v*.sh

### VMWare Workstation
sh scripts/install-vmware-workstation-v*.sh
sudo systemctl enable --now vmware-networks.service
sudo systemctl enable --now vmware-usbarbitrator.service
sudo systemctl enable --now vmware-hostd.service
#sudo pacman -S open-vm-tools --noconfirm --needed
#sudo systemctl enable vmtoolsd
#sudo systemctl start vmtoolsd

### Chat and Social
sudo pacman -S discord --noconfirm --needed

#sudo pacman -S  --noconfirm --needed

echo "################################################################"
echo "####                  Apps Installed                        ####"
echo "################################################################"
