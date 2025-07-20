#!/bin/bash

# Define the root directory
rootdir=".vim"

# Create the root directory if it doesn't exist
if [ ! -d "$rootdir" ]; then
    mkdir -p "$rootdir"
    echo "Created directory: $rootdir"
else
    echo "Directory already exists: $rootdir"
fi

# List of subdirectories to create
subdirs=("autoload" "colors" "plugged" "syntax" "undodir")

# Create each subdirectory
for subdir in "${subdirs[@]}"; do
    if [ ! -d "$rootdir/$subdir" ]; then
        mkdir -p "$rootdir/$subdir"
        echo "Created directory: $rootdir/$subdir"
    else
        echo "Directory already exists: $rootdir/$subdir"
    fi
done

echo "Directory structure created successfully."
