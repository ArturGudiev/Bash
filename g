#!/bin/bash
case "$1" in
	"u"|"update")
        git -c core.quotepath=false -c log.showSignature=false fetch origin --progress --prune
        ;;
	"")
		echo no arguments ;;
	"b")
		git branch -r ;;
	"f")
		git fetch --all ;;
	"hard"|"h")
		git reset --hard origin/master ;;
	"s"|"status")
		git status ;;
	"p"|"pull")
		git pull ;;
	"m"|"master")
		git checkout master ;;
esac 
