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

    "dir")
      cd $MG_DIR ;;

    "sql")
      psql -U postgres -d memory_guard ;;

    "go")
      port 5173 ;;


  esac
}