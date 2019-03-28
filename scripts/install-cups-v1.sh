#!/bin/bash
set -e
##################################################################################################################
# Author 	: 	Marco Obaid
# GitHub    :   https://github.com/marcoobaid
##################################################################################################################
#
#   Install/Configure CUPS Print Sharing for ArcoLinux
#
##################################################################################################################

sudo pacman -S --noconfirm --needed cups cups-pdf
sudo pacman -S ghostscript gsfonts gutenprint --noconfirm --needed
sudo pacman -S gtk3-print-backends --noconfirm --needed
sudo pacman -S libcups --noconfirm --needed
sudo pacman -S hplip --noconfirm --needed
sudo pacman -S system-config-printer --noconfirm --needed

sudo systemctl enable org.cups.cupsd.service
sudo systemctl start org.cups.cupsd.service

echo "################################################################"
echo "#########   printer management software installed     ##########"
echo "################################################################"
echo "### Now go to http://localhost:631/ to configure printers ###"
