#!/bin/bash

echo $#
if (( $# > 0 ));
then
    ls -l $1 --color 
else
    ec $(pwd)
    ls -l --color
fi
exec bash