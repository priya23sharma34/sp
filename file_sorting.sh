#!/bin/bash

# Prompt the user to enter the name of a directory
read -p "Enter the name of the directory: " directoryPath

# Check if the directory exists
if [ ! -d "$directoryPath" ]; then
    echo "Error: Directory \"$directoryPath\" does not exist."
    exit 1
fi
# List all the files in the given directory and sort them alphabetically
files=$(ls "$directoryPath" | sort)

# Create the "sorted" directory inside the given directory
sortedPath="$directoryPath/sorted"
if ! mkdir "$sortedPath"; then
    echo "Error: Unable to create the \"sorted\" directory."
    exit 1
fi

# Move each file to the "sorted" directory
numFilesMoved=0
for file in $files; do
    if ! mv "$directoryPath/$file" "$sortedPath"; then
        echo "Error: Unable to move file \"$file\"."
    else
        ((numFilesMoved++))
    fi
done

# Display success message with the total number of files moved
echo "Total files moved: $numFilesMoved"
