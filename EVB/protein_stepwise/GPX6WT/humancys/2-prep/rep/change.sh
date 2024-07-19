#!/bin/bash

# Define the prefix you want to add
prefix="rep$1_"

# Loop through all files in the current directory
for file in fep*; do
    # Check if it's a file (not a directory)
    if [ -f "$file" ]; then
        # Rename the file by adding the prefix
        mv "$file" "$prefix$file"
    fi
done
