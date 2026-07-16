#!/bin/zsh
case "$1" in 
	"dash2")
		cursor /Users/arturgudiev/Programming/Workspaces/dashboard.code-workspace ;;

	"hpmf")
		cursor /Users/arturgudiev/Programming/Workspaces/chp-mf.code-workspace ;;

	"tpl")
		code /Users/arturgudiev/Programming/NodeJS/templates-juggler/ ;;
	
	"mobile")
		code /Users/arturgudiev/Programming/Job/chp_online_mobile/ ;;

	"hp2c")
		cursor /Users/arturgudiev/Programming/Workspaces/project.code-workspace ;;

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


