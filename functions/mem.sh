#!/bin/zsh

MG_BACKEND_DIR=/Users/arturgudiev/Programming/projects/memory-guard/backend/
MG_FRONTEND_DIR=/Users/arturgudiev/Programming/projects/memory-guard/frontend/
MG_DIR=/Users/arturgudiev/Programming/projects/memory-guard

mem() {
  case "$1" in 
    "dirb")
      cd $MG_BACKEND_DIR ;;

    "b+"|"s+")
      cd $MG_BACKEND_DIR 
      go run .
      ;;
    
    "f+"|"ui+")
      cd $MG_FRONTEND_DIR
      npm run dev
      ;;

    "dirf")
      cd $MG_FRONTEND_DIR ;;

    "swagger")
      br http://localhost:3033/swagger/index.html ;;

      "swagger2")
      br http://158.160.36.7:3033/swagger/index.html# ;;


    "dir")
      cd $MG_DIR ;;

    "sql")
      psql -U postgres -d memory_guard ;;

    "go")
      port 5173 ;;

    "go2")
      br https://memoryguard.ru ;;


    "monitor")
      br https://dashboard.uptimerobot.com/monitors ;;

    "bot")
      br https://mg-bot-7d16.onrender.com/health;;

  esac
}