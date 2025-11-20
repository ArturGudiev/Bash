#!/bin/zsh

if [[ -z "$1" ]]; then
    echo "Usage: q <filename>"
    exit 1
fi

# Search for the file in Scripts and subdirectories
file_path=$(find ~/Programming/Bash/Scripts -type f -name "$1" | head -n 1)

if [[ -n "$file_path" ]]; then
    code "$file_path"
else
    echo "File '$1' not found in Scripts directory"
    exit 1
fi