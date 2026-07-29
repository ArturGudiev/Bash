#!/bin/zsh

use_cursor=false
filename=""

for arg in "$@"; do
    case "$arg" in
        -cursor|--cursor)
            use_cursor=true
            ;;
        -*)
            echo "Unknown option: $arg" >&2
            echo "Usage: q [-cursor] <filename>" >&2
            exit 1
            ;;
        *)
            if [[ -n "$filename" ]]; then
                echo "Usage: q [-cursor] <filename>" >&2
                exit 1
            fi
            filename=$arg
            ;;
    esac
done

if [[ -z "$filename" ]]; then
    echo "Usage: q [-cursor] <filename>"
    exit 1
fi

# Search for the file in Scripts and subdirectories (exact name, then .sh)
scripts_dir=~/Programming/Bash/Scripts
file_path=$(find "$scripts_dir" -type f -name "$filename" 2>/dev/null | head -n 1)
if [[ -z "$file_path" ]]; then
    file_path=$(find "$scripts_dir" -type f -name "$filename.sh" 2>/dev/null | head -n 1)
fi

if [[ -z "$file_path" ]]; then
    echo "File '$filename' not found in Scripts directory"
    exit 1
fi

if $use_cursor; then
    cursor "$file_path"
else
    code --disable-extensions "$file_path"
fi
