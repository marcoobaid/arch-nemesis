#!/bin/bash
set -e
##################################################################################################################
# Author 	: 	Marco Obaid
# GitHub    :   https://github.com/abumasood
##################################################################################################################
#
#   Install Nemo File Manager for ArcoLinux
##################################################################################################################

sudo pacman -S nemo --noconfirm --needed
sudo pacman -S nemo-seahorse --noconfirm --needed
sudo pacman -S nemo-fileroller --noconfirm --needed
sudo pacman -S nemo-image-converter --noconfirm --needed
sudo pacman -S nemo-preview --noconfirm --needed
sudo pacman -S nemo-python --noconfirm --needed
sudo pacman -S nemo-share --noconfirm --needed
sudo pacman -S nemo-terminal --noconfirm --needed


echo "################################################################"
echo "####        Software installed successfully               ######"
echo "################################################################"