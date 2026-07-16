#!/bin/zsh
# HP2 - Work-related navigation and commands for HP project

tpl_run() {
    node /Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js $1 
}

tpl() {
  case "$1" in 
	"")
		node /Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js ;;

	"dir")
		cd /Users/arturgudiev/Programming/NodeJS/templates-juggler/ ;;

  	"pro")
		code /Users/arturgudiev/Programming/NodeJS/templates-juggler/ ;;
	
	"b"|"bootstrap")
		node /Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js Bootstrap ;;

    "pro")
		code /Users/arturgudiev/Programming/NodeJS/templates-juggler ;;

	"commit")
		cd /Users/arturgudiev/Programming/NodeJS/templates-juggler
		git add --all
		git commit -m "Auto commit" 
		git push ;;

	"update")
		cd /Users/arturgudiev/Programming/NodeJS/templates-juggler
		git pull --rebase ;;

	"psql"|"postgres"|"postgresql")
		node /Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js PostgreSQL ;;

	"git")
		node /Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js Git ;;

	"flutter")
		node /Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js Flutter ;;
	
	"chp")
		node /Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js CHP ;;

	"bash")
		node /Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js Bash ;;

	"go")
		node /Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js Go ;;

	# "dart")
	# 	node /Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js Dart ;;

	"angular")
		tpl_run Angular ;;

	*)
		node /Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js $1 ;;


		

  esac
}

