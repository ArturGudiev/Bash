#!/bin/zsh
# HP2 - Work-related navigation and commands for HP project

DASH_BACKEND_DIR=/Users/arturgudiev/Programming/projects/dashboard-go/
DASH_FRONTEND_DIR=/Users/arturgudiev/Programming/projects/dashboard-ui/

dash() {
  case "$1" in 
    # "dir")
    #   cd /Users/arturgudiev/Programming/Job/chp_online_mobile ;;
    
    "dirb")
      cd $DASH_BACKEND_DIR ;;

    "dirf")
      cd $DASH_FRONTEND_DIR ;;
      
    "swagger")
      br http://localhost:8080/swagger/index.html ;;
      
    "go")
      port 4200 ;;

    "b+"|"s+")
      cd $DASH_BACKEND_DIR
      go run . 
      ;;

    "f+"|"ui+")
      dash dirf
      npm start ;;

    # "android+"|"android_build")
    #   cd /Users/arturgudiev/Programming/Job/chp_online_mobile/ ;
    #   flutter build apk ;;

    # "cpapk")
    #   cp /Users/arturgudiev/Programming/Job/chp_online_mobile/build/app/outputs/flutter-apk/app-release.apk $2 ;;
    # "m+")
    #   cd /Users/arturgudiev/Programming/Job/chp_online_mobile/ ;
    #   flutter run -d EA7FE8FA-DC4C-416A-BA6E-174311E43CC2;;

    # "go")
    #   port 5173 ;;

    # "swagger")
    #   open -a "Safari" 'http://localhost:8000/docs' ;;

    # "swaggerjson")
    #   open -a "Safari" 'http://localhost:8000/openapi.json' ;;

    # "hub")
    #   br "https://github.com/Kush013/CHPOnline#" ;;

    # "pr")
    #   br "https://github.com/Kush013/chp_online_mobile/pulls" ;;


    # "hub2")
    #   br "https://github.com/Kush013/chp_online_mobile" ;;

    # "figma")
    #   open -a "Safari" 'https://www.figma.com/design/Z5XpqNHhROerYLdU2UIVjb/%D0%9C%D0%B8%D0%BD%D0%B8%D1%81%D1%82%D0%B5%D1%80%D1%81%D1%82%D0%B2%D0%BE-%D0%96%D0%9A%D0%A5-%D0%A0%D0%A1%D0%9E-%D0%90%D0%BB%D0%B0%D0%BD%D0%B8%D1%8F?node-id=0-1&p=f&t=FSkoxucwgnAUb1XB-0' ;;

    # "pro")
    #   code "/Users/arturgudiev/Programming/Job/chp_online_mobile" ;;

    # "gile")
    #   br https://ru.yougile.com/team/248e303b8e99/%D0%A6%D0%B8%D1%84%D1%80%D0%BE%D0%B2%D0%BE%D0%B9-%D0%BE%D0%BF%D0%B5%D1%80%D1%88%D1%82%D0%B0%D0%B1 ;;
    
    # "address"|"addr")
    #   ec "Владикавказ ул Куйбышева 134 д 4 " ;;

    #  "move_to_icons"|"move_icons")
    #   mv $2 /Users/arturgudiev/Programming/Job/chp_online_mobile/assets/images/icons ;;

    "sql"|"db")
      psql -U postgres -d dashboard ;;

    # "uibackc"|"uiback_cursor")
    #   cursor  /Users/arturgudiev/Programming/Job/frontend/CHPOnline/ /Users/arturgudiev/Programming/Job/CHPOnline/ ;;
  
  
  esac
}