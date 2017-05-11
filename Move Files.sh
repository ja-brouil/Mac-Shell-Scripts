#!/bin/bash
# File Batch transfer
# This script automatically moves over files in batches to new folders with a naming convention
# Written by: James Brouillet
#

# Clear terminal
clear

# Global variables
n=1 # File movement
p=1 # Folder creation
l=1 # Naming number for folder creation

# Introduction
echo "This script will transfer over the amount of files you want into another directory and redo this until the folder is empty."
echo "Drag locations into the terminal window for locations when prompted."
echo "This will overwrite existing files in folders but not overwrite folders themselves."

# Set search location
echo "File that need to be transferred Location."
read LOC
cd "$LOC"
# Check and delete .ds file
if [ -f .DS_Store ]; then
	rm .DS_Store 
fi
LOCnew=$(echo "$LOC" | tr -d '[\]') # Clean file location if dragged in


# Set Max file movement
echo "Max number of files per created folder."
read FILEN

# Calculate amount of file transfers required

noffiles=$(find "$LOCnew" -type f -maxdepth 1 | wc -l )
transfers=$(( $noffiles / $FILEN ))
transfersn=$(( $transfers + 1 ))
echo "We will need $transfersn transfers."

# Set folder creation location
echo "Folder creation location"
read FLOC
# Check if location exists
if [ ! -d "$FLOC" ]; then
	echo "This location does not exist."
	echo "Creating the location."
	mkdir "$FLOC"
	cd "$FLOC"
fi
FLOCn=$(echo "$FLOC" | tr -d '[\]') #clean file location if dragged in or typed incorrectly

# Name for folders
echo "Folder name."
echo "Folders will be created with the naming convention NAME Number +1."
read FNAME

# Batch folder creation
while [ "$l" -le "$transfersn" ]; do
	set -- "$@" "$FNAME$l"
	l=$(( $l + 1 ));
done
cd "$FLOCn" # Change directory

# Create Directories
mkdir "$@"
echo "Folders Created."
l=1 #reset l to 1 for movement purposes

# Sequencing numbers
p=$(seq $transfersn) #transfer amount
n=$(seq $FILEN) #file amount

# File movement 
# Beginning of the outer Loop
for p in $p; do
	n=$(seq $FILEN) # Reset inner loop
	# Inner loop
	for n in $n; do
		move=$(find "$LOCnew" -type f -maxdepth 1 | head -1)
		mv -v "$move" ./"$FNAME""$l"
	done
	# End of inner loop
	let "l+=1"
done

# Script complete
echo "Complete."
exit 0


