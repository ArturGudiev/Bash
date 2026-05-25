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

	"angular")
		tpl_run Angular ;;

		

  esac
}

