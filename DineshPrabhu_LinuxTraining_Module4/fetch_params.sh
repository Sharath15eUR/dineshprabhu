#!/bin/bash

filename="$1"
output="output.txt"

# Check if the input file exists
if [ ! -e "$filename" ]; then
    echo "File $filename does not exist. Try again!"
    exit 1
fi

# Clear the output file before starting
> "$output"

# Extract and format the desired parameters

awk '
/frame.time/ {print "\"frame.time\": " substr($0, index($0, $2)) >> "'"$output"'"}
/wlan.fc.type/ {print "\"wlan.fc.type\": " $2 >> "'"$output"'"}
/wlan.fc.subtype/ {print "\"wlan.fc.subtype\": " $2 >> "'"$output"'"}
' "$filename" >> "$output"

echo "Extraction complete. See the output in $output"
