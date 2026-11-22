#!/bin/zsh
# HP2 - Work-related navigation and commands for HP project

TPL_APP="/Users/arturgudiev/Programming/NodeJS/templates-juggler/dist/index.js"
TPL_DIR="/Users/arturgudiev/Programming/NodeJS/templates-juggler"

# Launch by template-node name/alias
tpl_run() {
    node "$TPL_APP" --templates-node "$1"
}

# Launch by template alias (not node)
tpl_template() {
    node "$TPL_APP" -t "$1"
}

tpl() {
  case "$1" in
	"")
		node "$TPL_APP" ;;

	"dir")
		cd "$TPL_DIR"/ ;;

	"cp")
		cd "$TPL_DIR"/
		mgit cp
	;;

	"refresh"|"r")
		cd "$TPL_DIR"/
		mgit cpa
		tsc
	;;

	"cpa")
		cd "$TPL_DIR"/
		mgit cpa
	;;

	"cpc"|"u")
		cd "$TPL_DIR"/
		mgit cpa
		tsc
	;;

	"compile"|"tsc")
		cd "$TPL_DIR"/
		tsc
	;;

	"pro")
		code "$TPL_DIR" ;;

	"b"|"bootstrap")
		tpl_run Bootstrap ;;

	"commit")
		cd "$TPL_DIR"
		git add --all
		git commit -m "Auto commit"
		git push ;;

	"update")
		cd "$TPL_DIR"
		git pull --rebase ;;

	"update_local"|"ul")
		git
	;;

	"psql"|"postgres"|"postgresql")
		tpl_run PostgreSQL ;;

	"git")
		tpl_run Git ;;

	"flutter")
		tpl_run Flutter ;;

	"chp")
		tpl_run CHP ;;

	"bash")
		tpl_run Bash ;;

	"go")
		tpl_run Go ;;

	"angular")
		tpl_run Angular ;;

	"t"|"template")
		tpl_template "$2" ;;

	# Unknown args are treated as template aliases (use named cases / tpl_run for nodes)
	*)
		tpl_template "$1" ;;
  esac
}

