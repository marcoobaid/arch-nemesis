#!/bin/bash
set -e
##################################################################################################################
# Author 	: 	Marco Obaid
# GitHub    :   https://github.com/marcoobaid
##################################################################################################################
#
#   Install/Configure ufw Firewall for ArcoLinux
#
##################################################################################################################

sudo pacman -S ufw --noconfirm --needed
sudo pacman -S ufw-extras --noconfirm --needed
sudo pacman -S gufw --noconfirm --needed

echo "################################################################"
echo "####   Configuring Firewall Rules now .... Please Wait    ######"
echo "################################################################"

### Configure ufw to allow SSH and CUPS Print Sharing
sudo systemctl enable ufw
sudo systemctl start ufw
sudo ufw allow ssh
sudo ufw allow 631/tcp
sudo ufw enable

echo "################################################################"
echo "####        Software installed successfully               ######"
echo "################################################################"

