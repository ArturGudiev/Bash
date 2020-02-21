#!/bin/bash
case "$1" in 
	"common")
		code /home/sio/ScaleIO_Sizer/ ;;
	
	"calc")
		idea /home/sio/ScaleIO_Sizer/reliability-availability-service-v2/ >& /dev/null & ;;
	"ui"|"gui")
		idea /home/sio/ScaleIO_Sizer/sio-sizer-tools-client/ >& /dev/null & ;;
	"c"|"controller")
		idea /home/sio/ScaleIO_Sizer/sizer-controller >& /dev/null & ;;
	"manager"|"sizing-process-manager")
		idea /home/sio/ScaleIO_Sizer/sizing-process-manager/ >& /dev/null & ;;
esac
exec bash


