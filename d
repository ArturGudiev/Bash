#!/bin/bash
# $PASSED=`realpath $1`

if [[ -d `realpath $1` ]]; then
    rm -rf `realpath $1`
elif [[ -f `realpath $1` ]]; then
    rm `realpath $1`
else
    echo "$PASSED is not valid"
    exit 1
fi
l