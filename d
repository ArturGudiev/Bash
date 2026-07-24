#!/bin/zsh

if [[ -z "$1" ]]; then
    echo "Usage: d <path>"
    exit 1
fi

target=$(realpath "$1" 2>/dev/null) || {
    echo "'$1' is not valid"
    exit 1
}

if [[ ! -e "$target" ]]; then
    echo "'$target' is not valid"
    exit 1
fi

kind="file"
[[ -d "$target" ]] && kind="directory"

read "?Are you sure you want to delete the $kind '$target'? [y/N] " confirm
[[ "$confirm" == [yY] || "$confirm" == [yY][eE][sS] ]] || {
    echo "Cancelled"
    exit 0
}

if [[ -d "$target" ]]; then
    rm -rf "$target"
elif [[ -f "$target" ]]; then
    rm "$target"
else
    echo "'$target' is not valid"
    exit 1
fi
l
