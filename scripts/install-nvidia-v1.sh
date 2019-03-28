#!/bin/bash
set -e
##################################################################################################################
# Author 	: 	Marco Obaid
# GitHub    :   https://github.com/marcoobaid
##################################################################################################################
#
#   Install Nvidia Graphics Card Drivers for ArcoLinux
##################################################################################################################

sudo pacman -S nvidia --noconfirm --needed
sudo pacman -S nvidia-utils --noconfirm --needed
sudo pacman -S nvidia-settings --noconfirm --needed


echo "################################################################"
echo "####        Software installed successfully               ######"
echo "################################################################"
