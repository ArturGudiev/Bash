#!/bin/zsh
# HP2 - Work-related navigation and commands for HP project


hpapi() {
  case "$1" in 
    "api"|"")
      node /Users/arturgudiev/Programming/Job/chp_api/dist/index.js
      ;;

    "dir")
      cd /Users/arturgudiev/Programming/Job/chp_api ;;

    "pro")
      cursor /Users/arturgudiev/Programming/Job/chp_api ;;

    "compile")
      cd /Users/arturgudiev/Programming/Job/chp_api 
      tsc
      ;;
  
  esac
}