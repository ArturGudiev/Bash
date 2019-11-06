#!/bin/bash

# pwd= `pwd`
# echo "Directory: " + $pwd
# A=$pwd
# ec $A
ec $(pwd)
ls -l --color
exec bash