#!/bin/bash

#!/bin/bash
case "$1" in 
	"")
		m /home/sio/ScaleIO_Sizer/ ;;
	"1")
		m /home/sio/ScaleIO_Sizer/model-filtering-service/ ;;
	"2")
			m /home/sio/ScaleIO_Sizer/model-sorting-service/ ;;
	"3")
			m /home/sio/ScaleIO_Sizer/racalcclient-v2/ ;;
	"4"|"calc")
			m /home/sio/ScaleIO_Sizer/reliability-availability-service-v2/ ;;
	"45"|"calc2")
			m /home/sio/ScaleIO_Sizer/reliability-availability-service/ ;;
	"5")
			m  /home/sio/ScaleIO_Sizer/single-model-filter-service/;;
	"6")
			m  /home/sio/ScaleIO_Sizer/single-model-sizer-service/;;
	"7")
			m  /home/sio/ScaleIO_Sizer/sio-sizer-chassis-data-loader/;;
	"8")
			m  /home/sio/ScaleIO_Sizer/siosizer-data-loader/;;
	"9")
			m  /home/sio/ScaleIO_Sizer/sio-sizer-tools-client/;;
	"10")
			m  /home/sio/ScaleIO_Sizer/sizer-controller;;
	"11")
			m  /home/sio/ScaleIO_Sizer/sizing-process-manager/;;
	"4"|"calc")
		m /home/sio/ScaleIO_Sizer/reliability-availability-service ;;
	
    "45"|"calc2")
		m /home/sio/ScaleIO_Sizer/reliability-availability-service-v2/ ;;

esac
exec bash

# if [ "$1" == "" ]; then 
#     ccd /home/donny/Sizer
#     # nv src
# fi

# if [ "$1" == "1" ]; then 
#     ccd /home/donny/Sizer/model-filtering-service/
# fi

# if [ "$1" == "2" ]; then 
#     ccd /home/donny/Sizer/model-sorting-service/
# fi

# if [ "$1" == "3" ]; then 
#     ccd /home/donny/Sizer/racalcclient-v2
# fi

# if [ "$1" == "4" ]; then 
#     ccd /home/donny/Sizer/reliability-availability-service
# fi

# if [ "$1" == "5" ]; then 
#     ccd /home/donny/Sizer/single-model-sizer-service/
# fi

# if [ "$1" == "6" ]; then 
#     ccd /home/donny/Sizer/sio-sizer-chassis-data-loader/
# fi

# if [ "$1" == "7" ]; then 
#     ccd /home/donny/Sizer/sio-sizer-tools-client/
# fi

# if [ "$1" == "8" ]; then 
#     ccd /home/donny/Sizer/siosizer-data-loader/
# fi

# if [ "$1" == "9" ]; then 
#     ccd /home/donny/Sizer/sizer-controller/
# fi

# if [ "$1" == "10" ]; then 
#     ccd /home/donny/Sizer/sizing-process-manager/
# fi

# if [ "$1" == "11" ]; then 
#     ccd /home/donny/Sizer/sizing-process-manager/
# fi