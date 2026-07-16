#!/bin/zsh

if [[ -z "$1" ]]; then
    echo "Usage: q <filename>"
    exit 1
fi

# Search for the file in Scripts and subdirectories (exact name, then .sh)
scripts_dir=~/Programming/Bash/Scripts
file_path=$(find "$scripts_dir" -type f -name "$1" 2>/dev/null | head -n 1)
if [[ -z "$file_path" ]]; then
    file_path=$(find "$scripts_dir" -type f -name "$1.sh" 2>/dev/null | head -n 1)
fi

if [[ -n "$file_path" ]]; then
    code "$file_path"
else
    echo "File '$1' not found in Scripts directory"
    exit 1
fi