#!/bin/bash
set -e
##################################################################################################################
# Author 	: 	Marco Obaid
# GitHub    :   https://github.com/marcoobaid
##################################################################################################################
#
#   Install/Configure hblock-git for ArcoLinux
#
##################################################################################################################

sudo pacman -S arcolinux-hblock-git --noconfirm --needed

echo "################################################################"
echo "####       Configuring hblock now .... Please Wait        ######"
echo "################################################################"

### Configure hblock settings
sudo systemctl enable hblock.timer
sudo systemctl start hblock.timer
sudo hblock

echo "################################################################"
echo "####        Software installed successfully               ######"
echo "################################################################"

