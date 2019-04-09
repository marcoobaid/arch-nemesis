#!/bin/bash
set -e
##################################################################################################################
# Author 	: 	Marco Obaid
# GitHub    :   https://github.com/marcoobaid
##################################################################################################################
#
#   Install/Conigure Powerline on ArcoLinux
#
##################################################################################################################

sudo pacman -S powerline --noconfirm --needed
sudo pacman -S powerline-fonts --noconfirm --needed
sudo pacman -S powerline-vim --noconfirm --needed
sudo pacman -S python-powerline --noconfirm --needed

### Configure Powerline for vim
cp -f ~/DATA/dotfiles/powerline/vim/.vimrc ~/
cat ~/DATA/dotfiles/powerline/vim/etc-vimrc | sudo tee -a /etc/vimrc
echo "### /etc/vimrc has been updated ###"

### Configure Powerline for tmux
cp -f ~/DATA/dotfiles/powerline/tmux/.tmux.conf ~/
echo "### .tmux.conf has been copied to home folder ###"

echo "################################################################"
echo "#########          Powerline is now configured        ##########"
echo "################################################################"
