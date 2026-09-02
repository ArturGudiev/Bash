#!/bin/zsh

DASH_BACKEND_DIR=/Users/arturgudiev/Programming/projects/dashboard-go/
DASH_FRONTEND_DIR=/Users/arturgudiev/Programming/projects/dashboard-ui/
DASH_DATA_DIR=/Users/arturgudiev/Programming/projects/dashboard-ui/

zali() {
  case "$1" in 

  "figma")
    br 'https://www.figma.com/design/WQV1zPCijwvAVG2J4egc80/%D0%B4%D0%B0%D1%80%D0%B3%D0%B0%D0%B2%D1%81?node-id=0-1&p=f&t=FSMbl7HhUweE4h6z-0'
    ;;

  "dir")
    cd /Users/arturgudiev/Programming/projects/dargavs-landing-page/
    ;;

  "go")
    port 3000
    ;;
  
  "+")
    cd /Users/arturgudiev/Programming/projects/dargavs-landing-page/
    npm run dev 
    ;;

  "move_image")
      mv $2 /Users/arturgudiev/Programming/projects/dargavs-landing-page/public/images  
      ;;


  esac
}