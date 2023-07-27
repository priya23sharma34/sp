






#!/bin/bash

logs_directory="log"

# Check if the logs directory exists
if [ ! -d "$logs_directory" ]; then
    echo "The '$logs_directory' directory does not exist."
    exit 1
fi

# Find all log files in the directory and loop through them
find "$logs_directory" -type f -name "log_*.txt" | while read -r log_file; do
    echo "Processing '$log_file':"

    # Extract timestamp and message using awk
    awk -F ' - ' '{print "Timestamp:", $1; print "Message:", $2; print "----"}' "$log_file"
done
