#!/bin/bash
set -e
##################################################################################################################
# Author 	: 	Marco Obaid
# GitHub    :   https://github.com/abumasood
##################################################################################################################
#
#   Main Script to run post Arcolinux install to install/configure applications and settings
#
##################################################################################################################


echo "##### Cloning Github Repos #####"
if [ ! -d "$HOME/DATA" ]; then
	mkdir $HOME/DATA  
fi
cd $HOME/DATA
git clone https://github.com/abumasood/myfiles
git clone https://github.com/abumasood/mybackgrounds

echo "################################################################"
echo "####                Github Repos Cloned                   ######"
echo "################################################################"