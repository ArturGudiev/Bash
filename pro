#!/bin/zsh
source "${0:A:h}/functions/utils.sh"

case "$1" in
	"scripts")
		openProjectAndFile /Users/arturgudiev/Programming/Bash/Scripts/ "$2" ;;

	"dash2")
		openProjectAndFile /Users/arturgudiev/Programming/Workspaces/dashboard.code-workspace "$2" ;;

	"mem"|"mg")
		openProjectAndFile /Users/arturgudiev/Programming/projects/memory-guard/ "$2" ;;

	"hpmf")
		openProjectAndFile /Users/arturgudiev/Programming/Workspaces/chp-mf.code-workspace "$2" ;;

	"tpl")
		openProjectAndFile /Users/arturgudiev/Programming/NodeJS/templates-juggler/ "$2" ;;

	"mobile")
		openProjectAndFile /Users/arturgudiev/Programming/Job/chp_online_mobile/ "$2" ;;

	"hpbf"|"hpfb")
		openProjectAndFile /Users/arturgudiev/Programming/Workspaces/chp-bf.code-workspace "$2" ;;

	"hpmb"|"hpbm")
		openProjectAndFile /Users/arturgudiev/Programming/Workspaces/chp_mb.code-workspace "$2" ;;

	"calc")
		idea /home/sio/ScaleIO_Sizer/reliability-availability-service-v2/ >& /dev/null & ;;

	"ui"|"gui")
		idea /home/sio/ScaleIO_Sizer/sio-sizer-tools-client/ >& /dev/null & ;;

	"c"|"controller")
		idea /home/sio/ScaleIO_Sizer/sizer-controller >& /dev/null & ;;

	"manager"|"sizing-process-manager")
		idea /home/sio/ScaleIO_Sizer/sizing-process-manager/ >& /dev/null & ;;

esac
exec zsh
