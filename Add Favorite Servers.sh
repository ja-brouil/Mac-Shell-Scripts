#!/bin/bash
# Set favorites for servers
# Written by James Brouillet
# Variables

QUMULO="URL://SERVERNAME"
OLDSERVERAFP="URL://SERVERNAME"
OLDSERVERSMB="URL://SERVERNAME"
#this check if the names are already in there
CHECK1=$(/usr/bin/sfltool dump-storage ~/Library/Application\ Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.FavoriteServers.sfl | awk '{print $NF}' | sort -u | sed -ne 's/^URL://p')
#Clear Terminal screen
clear

#Delete Old Favorites
echo "Removing old server favorite files."
sfltool clear
killall Finder

echo "Adding SERVERNAME"
/usr/bin/sfltool add-item -n "Servername" com.apple.LSSharedFileList.FavoriteServers "URL://SERVERNAME"

echo -e "\nAdding Old Server"
/usr/bin/sfltool add-item -n "Old Server AFP" com.apple.LSSharedFileList.FavoriteServers "URL://SERVERNAME"

echo -e "\nAdding Old Server SMB"
/usr/bin/sfltool add-item -n "Old Server SMB" com.apple.LSSharedFileList.FavoriteServers "URL://SERVERNAME"

killall cfpresfsd
killall Finder

echo -e "\nScript done."
exit
