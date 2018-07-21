#!/bin/bash
case "$1" in 
	"")
		cd ~/Programming ;;
	
	"sh")
		cd ~/Programming/Shell ;;

esac
exec bash

#if [ "$1" == "sh" ]; then
#   cd ~/Programming/Shell
#else cd ~/Programming
#fi

