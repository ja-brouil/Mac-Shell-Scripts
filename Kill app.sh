#!/bin/bash
# Check for process then kill it if true
# Global Variables
# Input process

echo "Input process name."
read process
pss=$(ps -ef | grep -v grep | grep -i "$process")

if [ -n "$pss" ]; then
	echo "Application exists, killing it."
	ps -ef | grep -i "$process" | grep -v grep | awk '{print $2}' | xargs kill -9
	echo "Done"
	exit 1
else
	echo "No such application is running."
fi

exit 1