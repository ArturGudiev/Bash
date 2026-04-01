#!/bin/zsh

echo $#
if [[ "$1" == "-d" ]]; then
    printInCenter $(pwd)
    ls -lG -d */
elif (( $# > 0 )); then
    ls -lG $1
else
    printInCenter $(pwd)
    ls -lG
fi
echo ""
# exec zsh