#!/bin/bash
set -e
##################################################################################################################
# Author 	: 	Marco Obaid
# GitHub    :   https://github.com/abumasood
##################################################################################################################
#
#   Install lightdm-webkit
#
##################################################################################################################

sudo pacman -S lightdm --noconfirm --needed
#sudo pacman -S lightdm-webkit-theme-aether --noconfirm --needed
sh scripts/install-lightdm-aether-v*.sh
sudo pacman -S lightdm-webkit-theme-archlinux --noconfirm --needed
sudo pacman -S lightdm-webkit2-greeter --noconfirm --needed


echo "################################################################"
echo "#########          lightdm is now configure           ##########"
echo "################################################################"
