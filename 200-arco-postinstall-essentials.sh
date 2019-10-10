# Author 	: 	Marco Obaid
# GitHub    :   https://github.com/marcoobaid
##################################################################################################################
#
#   Main Script to run post Arcolinux install to install/configure applications and settings
#
##################################################################################################################

echo "################################################################"
echo "####                Essential Tools                       ######"
echo "################################################################"

#echo "##### Configure system to use ALL core to Makepkg #####"
#sh scripts/000-use-all-cores-makepkg-conf-v3.sh
echo "##### Installing CUPs #####"
sh scripts/install-cups-v*.sh  ###>>> Need to install Brother HL-2070N printer
echo "##### Installing hblock service #####"
sh scripts/install-hblock-v*.sh
echo "##### Installing Lightdm Webkit #####"
#sh scripts/install-lightdm-webkit-v*.sh
#echo "##### Installing Nvidia #####"
#sh scripts/install-nvidia-v*.sh
echo "##### Installing Powerline #####"
sh scripts/install-powerline-v*.sh
echo "##### Configuring swapfile #####"
sh scripts/install-swapfile-v*.sh
echo "##### Installing Firewall #####"
sh scripts/install-ufw-v*.sh  
echo "##### Installing ZSH #####"
sh scripts/install-zsh-v*.sh
echo "### Enable SSHD Service ###"
sudo systemctl enable sshd.service
sudo systemctl start sshd.service
echo "### Installing Additional Drivers"
sh scripts/install-wd719x-firmware-v*.sh
sh scripts/install-wd719x-firmware-v*.sh
#echo "### Speeding up Reboot"
#sh scripts/940-disable-lvm2-reduce-shutdown-time-v*.sh

echo "################################################################"
echo "####                Essential Tools Done                  ######"
echo "################################################################"
