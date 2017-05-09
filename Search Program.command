#!/bin/bash
#Search Script
#Written by James.
#Date: May 2nd 2017

#Set Global variables

title="Search Program"
prompt="Yes No Quit"
options=("Yes" "No" "Quit")

#Clear Terminal Screen
clear

echo "$title"
echo "Enter Search Term"
#Enter Search Term Variable
read searchterm

#Repeat Search Term
echo "$searchterm is what you entered."

#Set search location
echo "Where do you want to search? Drag and drop the location or type the location. This only work with 1 folder at a time."
read filelocation

#Repeat Location Term
echo "$filelocation is where we will be searching. Starting search..."
sleep 1

#Search for files -iname Removes Case sensitivity
find "$filelocation" -iname "*$searchterm*" | tee ~/Desktop/$searchterm.txt

echo "Search complete."

#Search Again Query
echo "Perform another search?"


#Exit
