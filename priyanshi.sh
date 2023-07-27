#!/bin/bash

# Prompt the user to enter the name of a directory
read -p "Please enter the name of a directory: " directory_name

# You can now use the 'directory_name' variable to perform further operations
echo "You entered: $directory_name"
# Check if the directory exists
if [ ! -d "$directory_name" ]; then
    echo "Error: Directory '$directory_name' does not exist."
    exit 1
fi

# If the directory exists, continue with the rest of the script
echo "Directory '$directory_name' exists."
# List all the files in the directory
echo "Files in directory '$directory_name':"
ls "$directory_name"
