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
sudo pacman -S cmatrix --noconfirm --needed
sudo pacman -S cool-retro-term --noconfirm --needed
sudo pacman -S cowfortune --noconfirm --needed
sudo pacman -S figlet --noconfirm --needed
sudo pacman -S lolcat --noconfirm --needed
sudo pacman -S boxes --noconfirm --needed

### Graphics
sudo pacman -S blender --noconfirm --needed
sudo pacman -S flameshot --noconfirm --needed

### Tools 
sudo pacman -S mc --noconfirm --needed
sudo pacman -S ranger --noconfirm --needed
sudo pacman -S sl --noconfirm --needed
sudo pacman -S ufetch-arco-git --noconfirm --needed
sudo pacman -S youtube-dl --noconfirm --needed
sudo pacman -S gtop --noconfirm --needed
sh scripts/install-vtop-v*.sh
sh scripts/install-nemo-v*.sh
sh scripts/install-caffeine-ng-v*.sh
sh scripts/install-polybar-v*.sh

### System
###sudo pacman -S qt5ct --noconfirm --needed
sudo pacman -S expac --noconfirm --needed
sudo pacman -S linux-headers --noconfirm --needed

### Virtualbox
sh scripts/install-virtualbox-host-v*.sh
#sudo pacman -S virtualbox-guest-modules-arch --noconfirm --needed

### VMWare Workstation
sh scripts/install-vmware-workstation-v*.sh
sudo pacman -S open-vm-tools --noconfirm --needed
sudo systemctl enable vmtoolsd
sudo systemctl start vmtoolsd

### Chat and Social
sudo pacman -S discord --noconfirm --needed

#sudo pacman -S  --noconfirm --needed

echo "################################################################"
echo "####                  Apps Installed                        ####"
echo "################################################################"
