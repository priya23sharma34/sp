#!/bin/bash

logs_directory="log"
given_date="2023-07-20"  # Replace this with your desired date in "YYYY-MM-DD" format

# Convert the given date to timestamp (seconds since Unix epoch)
given_timestamp=$(date -d "$given_date" +%s)

# Check if the logs directory exists
if [ ! -d "$logs_directory" ]; then
    echo "The '$logs_directory' directory does not exist."
    exit 1
fi

# Find all log files in the directory and loop through them
find "$logs_directory" -type f -name "log_*.txt" | while read -r log_file; do
    echo "Processing '$log_file':"

    # Extract timestamp and message using awk
    awk -F ' - ' -v given_timestamp="$given_timestamp" '{
        gsub(/[-:]/, " ", $1);
        log_timestamp = mktime($1);
        if (log_timestamp >= given_timestamp) {
            print "Timestamp:", $1;
            print "Message:", $2;
            print "----";
        }
    }' "$log_file"
done | sort -nr -k2 -k4 | awk '{
    if ($1 == "Timestamp:") {
        timestamp = $2;
    } else if ($1 == "Message:") {
        message = $2;
        print "Timestamp:", timestamp;
        print "Message:", message;
        print "";
    }
}' > filtered_logs.txt
