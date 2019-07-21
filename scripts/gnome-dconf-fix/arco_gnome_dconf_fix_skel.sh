#!/bin/bash

#set -e

##################################################################################################################
# Author: 	Marco Obaid
# GitHub:   https://github.com/marcoobaid
##################################################################################################################
#
#   Script to upload Arcolinux Gnome preferred settings to dconf database in /etc/skel only 
#  
######################################################################################################################
# When you run skel command after updates from Arcolinux, the default dconf database /etc/skel will overwrite the 
# dconf database in your home folder (~/.config/dconf) and your default keyboard settings will revert to "Belgian".
# This script can be integrated into the skel command so that your preferred settings will be upload to the dconf
# database in /etc/skel before, it is copied to your home folder. This should alleviate any frustration of having to 
# reconfigure your settings each time you run a skel command. The same script can be used to upload other preferences. You
# will need to place the preferences for each dconf hive in a seperate file and update the script below. Refer to the script
# below and follow how the keyboard settings as an example (dconf_change_path1 and dconf_load_settings1). You will need to use
# dconf editor to identify the path and the syntax for your preferred changes.
#
# 
# How to use the script
# #####################
# Make sure the script has "execute" permissions and run it. The script will create a "~/backup" folder to store backups
# of the original dconf database before it uploads any settings. You can always restore the original database (copy/paste).
# The script expects the preferred settings files to be in the backup folder. There are two settings that this script will
# change by default. 1) It will make gnome keyboard mapping "US" (you can change it to your liking) 2) it will implement
# a Power setting to prevent the system from hypernating after 20 minutes of idle time. This setting is turned on by default
# and causes the VirtualBox VM to freeze.
#
# If previous backups of dconf databases exist, the script will move the old ones into "archive" folder to keep things clean.
#############################################################################################################################

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
mv -f $backup_dir/backup_dconf* $archive_dir 2>/dev/null
rm -rf $backup_dir/backup_dconf* 2>/dev/null
cp /etc/skel/.config/dconf/user $backup_dir/backup_dconf_skel_$(date +%Y.%m.%d-%H.%M.%S) 2>/dev/null
cp $HOME/.config/dconf/user $backup_dir/backup_dconf_user_$(date +%Y.%m.%d-%H.%M.%S) 2>/dev/null
echo ""
echo "###############################################################################"
echo "dconf databases in /etc/skel and user home dir have been successfully backed up"
echo "###############################################################################"
echo ""
ls -la $HOME/backup/backup*
echo ""

# Let's define preferred dconf settings to be uploaded - ADD ANY ADDITIONAL SETTINGS FOLLOWING THE PATTERN BELOW
#
# Keyboard Map
dconf_change_path1="/org/gnome/desktop/input-sources/"
dconf_load_settings1=$backup_dir/load_dconf_settings1
#
# Do not hypernate after 20 minutes
dconf_change_path2="/org/gnome/settings-daemon/plugins/power/"
dconf_load_settings2=$backup_dir/load_dconf_settings2
#

# Let's upload the peferred settings to /etc/skel/.config/dconf/user database
echo -n "Would you like to load settings to dconf in /etc/skel? y/n "
echo ""
echo "**********************************************************************"
echo "(I will be looking for load_dconf_settings file(s) in ~/backup folder)"
echo "Press y to continue or any key to exit ..."
read answer

if [ $answer = "y" ]; then
	mv -f $HOME/.config/dconf/user $HOME/.config/dconf/user_backup 2>/dev/null
	cp /etc/skel/.config/dconf/user $HOME/.config/dconf/user 2>/dev/null
	dconf load $dconf_change_path1 < $dconf_load_settings1
	dconf load $dconf_change_path2 < $dconf_load_settings2
	dconf update
	echo ""
	echo "###############################################################################"
	echo "Replacing the dconf database in skel folder ..."
	echo "###############################################################################"
	echo ""
	sudo sudo mv -f $HOME/.config/dconf/user /etc/skel/.config/dconf/ 2>/dev/null
	mv -f $HOME/.config/dconf/user_backup $HOME/.config/dconf/user 2>/dev/null
	dconf update
	echo ""
	echo "###############################################################################"
	echo "New dconf settings have been loaded into dconf skel database. Please check now!"
	echo "*** Backup copies of dconf databases in skel and user home are in ~/backup ***"
	echo "###############################################################################"
	echo ""
	ls -la /etc/skel/.config/dconf/user*
	echo ""
	echo "******************** DONE !!! ***********************"
else
	echo ""
	echo "###############################################################################"
	echo "DONE! ... No further action required ... Doublcheck your $backup_dir"
	echo "###############################################################################"
	echo ""
fi