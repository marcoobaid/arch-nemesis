#!/bin/bash

#set -e

##################################################################################################################
# Author: 	Marco Obaid
# GitHub:   https://github.com/marcoobaid
##################################################################################################################
#
#   Script to Fix Arcolinux Gnome default settings in dconf database in /etc/skel and user home ~/.config/dconf
#  
######################################################################################################################
# Arcolinux stores its configurations and gnome settings in a default directory in /etc/skel. Some of these settings
# default to settings that may not meet the prefrence of the entire user community. For example, the default keyboard
# mapping is set to "Belgian" by default. Furthermore, running the "skel" alias, used to update the system settings,
# will reset the user customizations to the default stock settings, overwritting dconf desired defaults.
# This script is intended to automate the process of restoring any desired personal settings to /etc/skel and user
# home Gnome dconf database. It will do this process in the following order:
# 		1. Backup the existing /etc/skel and ~/.config/dconf user databases (in case a rollback is needed).
#		2. Dump the existing /etc/skel and ~/.config/dconf user database to text files, for comparison purposes.
#		3. Upload any desired settings to the user home dconf database.
# To upload settings, the respective dconf path must be explicitly stated in the script. For example:
#	conf_change_path1="/org/gnome/desktop/input-sources/"
# Then, drop the settings in a file within the backup folder and explicitly define it in the script. For example:
# 	dconf_load_settings1=$backup_dir/load_dconf_settings1
######################################################################################################################

# Let's set some variables
backup_dir=$HOME/backup
archive_dir=$backup_dir/archive/

if [ ! -d "$backup_dir" ]; then
	#mkdir $HOME/backup
	echo ""
	echo "###############################################################################"
	echo "~/backup folder does not exist. Exiting now!"
	echo "###############################################################################"
	echo""
	exit 0
fi

cd $backup_dir

# Backup dconf databases from user home and /etc/skel
if [ ! -d "$archive_dir" ]; then
	mkdir $archive_dir
fi
mv -f $backup_dir/backup_dconf* $archive_dir
rm -rf $backup_dir/backup_dconf* 
cp /etc/skel/.config/dconf/user $backup_dir/backup_dconf_skel_$(date +%Y.%m.%d-%H.%M.%S)
cp $HOME/.config/dconf/user $backup_dir/backup_dconf_user_$(date +%Y.%m.%d-%H.%M.%S)
echo ""
echo "###############################################################################"
echo "dconf databases in /etc/skel and user home dir have been successfully backed up"
echo "###############################################################################"
echo ""
ls -la $HOME/backup/backup*
echo ""

# Let's dump skel and user settings to do a comparison
cp /etc/skel/.config/dconf/user $HOME/.config/dconf/skel_user
printf %s\\n "user-db:skel_user" > db_profile
DCONF_PROFILE=$backup_dir/db_profile dconf dump / > dump_dconf_skel_settings.txt 
rm -f db_profile
rm -f $HOME/.config/dconf/skel_user
printf %s\\n "user-db:user" > db_profile
DCONF_PROFILE=$backup_dir/db_profile dconf dump / > dump_dconf_user_settings.txt
rm -f db_profile

echo "################################################################################################"
echo "Text dump of skel and user home dconf databases have been successfully generated"
echo "Please go to the backup folder to review dump_dconf_skel_settings and dump_dconf_user_settings"
echo "Meld is a good tool to do compare the user settings to the default Arcolinux settings"
echo "################################################################################################"
echo ""
ls -la $HOME/backup/dump*
echo ""

# Let's load new settings to dconf in user home
dconf_change_path1="/org/gnome/desktop/input-sources/"
dconf_load_settings1=$backup_dir/load_dconf_settings1
dconf_change_path2="/org/gnome/settings-daemon/plugins/power/"
dconf_load_settings2=$backup_dir/load_dconf_settings2

echo -n "Would you like to load settings to dconf? y/n "
echo ""
echo "**********************************************************************"
echo "(I will be looking for load_dconf_settings file in ~/backup folder)"
echo "Press y to continue or any key to exit ..."
read answer

if [ $answer = "y" ]; then
	dconf load $dconf_change_path1 < $dconf_load_settings1
	dconf load $dconf_change_path2 < $dconf_load_settings2
	dconf update
	echo ""
	echo "###############################################################################"
	echo "New dconf settings have been loaded into dconf user database. Please check now!"
	echo "###############################################################################"
	echo ""
else
	echo ""
	echo "###############################################################################"
	echo "No further action required ... Doublcheck your $backup_dir"
	echo "###############################################################################"
	echo ""
fi

# Let's upload the same settings to /etc/skel/.config/dconf/user database

echo -n "Would you like to load settings to dconf in /etc/skel? y/n "
echo ""
echo "**********************************************************************"
echo "(I will be looking for load_dconf_settings file in ~/backup folder)"
echo "Press y to continue or any key to exit ..."
read answer

if [ $answer = "y" ]; then
	mv -f $HOME/.config/dconf/user $HOME/.config/dconf/user_backup
	cp /etc/skel/.config/dconf/user $HOME/.config/dconf/user
	dconf load $dconf_change_path1 < $dconf_load_settings1
	dconf load $dconf_change_path2 < $dconf_load_settings2
	dconf update
	echo ""
	echo "###############################################################################"
	echo "Replacing the dconf database in skel folder ..."
	echo "###############################################################################"
	echo ""
	sudo sudo mv -f $HOME/.config/dconf/user /etc/skel/.config/dconf/
	mv -f $HOME/.config/dconf/user_backup $HOME/.config/dconf/user
	dconf update
	echo ""
	echo "###############################################################################"
	echo "New dconf settings have been loaded into dconf skel database. Please check now!"
	echo "*** Backup copies of dconf databases in skel and user home are in ~/backup ***"
	echo "###############################################################################"
	echo ""
else
	echo ""
	echo "###############################################################################"
	echo "No further action required ... Doublcheck your $backup_dir"
	echo "###############################################################################"
	echo ""
fi