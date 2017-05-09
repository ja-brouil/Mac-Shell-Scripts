#!/bin/bash

# Batch File Creation

N=1
B=1

#Clear terminal screen
clear
#Intro Message
echo "This program will create multiple directories for you."
echo "This will NOT override folder and files if it already exists."
echo "It will return a message saying that the folder already exists."


# Select storage place.
echo "Where do you want to save the files?"
read STORAGELOCATION

if [ ! -d "$STORAGELOCATION" ]; then
	echo "This location does not exist."
	echo "Creating the location."
	mkdir "$STORAGELOCATION"
	cd "$STORAGELOCATION"
fi

cd "$STORAGELOCATION"


# Select Batch number for files
# How many folders do you want?
echo "How many folders do you want? Enter a number"
read FOLDERAMT

# Name of folders
echo "Each folder name will have the name that you put plus a number after it to signify the next batch."
echo "What do you want to name the folders?"
read FOLDERNAME

set -- # Set the array list to be empty. Variable $@
	
	#set Creation Loop for naming
while [ "$N" -le "$FOLDERAMT" ]; do
	set -- "$@" "$FOLDERNAME$N"
	N=$(( $N + 1 ));
done

#Create Directories
mkdir "$@"
echo "Folders Created."

