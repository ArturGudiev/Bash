#!/bin/zsh

echo $#
if [[ "$1" == "-d" ]]; then
    printInCenter $(pwd)
    ls -laG -d */
elif (( $# > 0 )); then
    ls -laG $1
else
    printInCenter $(pwd)
    ls -laG
fi
echo ""
# exec zsh