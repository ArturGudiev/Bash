#!/bin/bash
case "$1" in
	"u"|"update")
        git -c core.quotepath=false -c log.showSignature=false fetch origin --progress --prune
        ;;
	"")
		echo no arguments ;;
	"p"|"profile")
		code ~/.profile ;;
esac 
