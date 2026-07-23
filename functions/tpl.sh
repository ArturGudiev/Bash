#!/bin/zsh
# HP2 - Work-related navigation and commands for HP project

tpl_run() {
    node /Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js --templates-node $1 
}

tpl() {
  case "$1" in 
	"")
		node /Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js ;;

	"dir")
		cd /Users/arturgudiev/Programming/NodeJS/templates-juggler/ ;;

	"cp"|"cpa")
		cd /Users/arturgudiev/Programming/NodeJS/templates-juggler/
		mgit cp;	
	;;

	"compile"|"tsc")
		cd /Users/arturgudiev/Programming/NodeJS/templates-juggler/ ;
		tsc ;;

  	"pro")
		code /Users/arturgudiev/Programming/NodeJS/templates-juggler/ ;;
	
	"b"|"bootstrap")
		node /Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js --templates-node Bootstrap ;;

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
		node /Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js --templates-node PostgreSQL ;;

	"git")
		node /Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js --templates-node Git ;;

	"flutter")
		node /Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js --templates-node Flutter ;;
	
	"chp")
		node /Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js --templates-node CHP ;;

	"bash")
		node /Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js --templates-node Bash ;;

	"go")
		node /Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js --templates-node Go ;;

	"angular")
		tpl_run Angular ;;

	*)
		node /Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js $1 ;;

  esac
}

