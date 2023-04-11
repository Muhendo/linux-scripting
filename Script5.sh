#!/bin/bash

# Set original file
orig_file="file1.txt"

# Set file to compare
cmp_file="file2.txt"

# Check if original file exists
if [ ! -f "$orig_file" ]; then
    echo "Error: Original file $orig_file does not exist."
    exit 1
fi

# Check if file to compare exists
if [ ! -f "$cmp_file" ]; then
    echo "Error: File to compare $cmp_file does not exist."
    exit 1
fi

# Compare files and sync if necessary
if ! cmp -s "$orig_file" "$cmp_file"; then
    echo "Files are different. Syncing $cmp_file with $orig_file..."
    cp "$cmp_file" "$orig_file"
    echo "Done."
else
    echo "Files are identical. No action taken."
fi
