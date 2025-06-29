#!/bin/bash

# Folder to process (current directory if none provided)
TARGET_DIR="${1:-.}"

# Loop through all files in the folder
for file in "$TARGET_DIR"/*; do
    # Only process files, skip directories
    if [ -f "$file" ]; then
        basename=$(basename "$file")
        
        # Remove 'OceanofPDF' or 'OceanofPDF.com'
        cleaned=$(echo "$basename" | sed 's/OceanofPDF\.com//g' | sed 's/OceanofPDF//g')

        # Replace underscores with spaces
        cleaned=$(echo "$cleaned" | tr '_' ' ')

        # Trim leading/trailing spaces
        cleaned=$(echo "$cleaned" | sed 's/^ *//; s/ *$//')

        # Skip if filename didn't change
        if [ "$basename" != "$cleaned" ]; then
            mv -v "$file" "$TARGET_DIR/$cleaned"
        fi
    fi
done
