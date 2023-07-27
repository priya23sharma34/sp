#!/bin/bash

logs_directory="log"

# Check if the logs directory exists
if [ ! -d "$log-files" ]; then
    echo "The '$log-files' directory does not exist."
    exit 1
fi

# Find all log files in the directory and loop through them
for file in log-file*txt; do
   if [ -f "$file" ]; then
   echo "reading contents of log files: $file"
   cat "$file"
   echo "________________________________________________"
fi
