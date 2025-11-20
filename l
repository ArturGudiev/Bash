#!/bin/zsh

echo $#
if [[ "$1" == "-d" ]]; then
    ec $(pwd)
    ls -lG -d */
elif (( $# > 0 )); then
    ls -lG $1
else
    ec $(pwd)
    ls -lG
fi
echo ""
# exec bash