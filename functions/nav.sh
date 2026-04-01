#!/bin/zsh
# Navigation function - quickly navigate to common directories

nav() {
  local LOC
  
  case "$1" in 
    "job")
      LOC=/Users/arturgudiev/Programming/Job/ ;;
    "down")
      LOC=~/Downloads/ ;;
    "desktop")
      LOC=~/Desktop/ ;;
    
    "pg")
      LOC=/Library/PostgreSQL/18/data/ ;;

    "sh")
      LOC=/Users/arturgudiev/Programming/Bash/Scripts/ ;;
    "scr"|"scripts")
      LOC=~/Programming/Bash/Scripts/ ;;
    *)
      echo "Unknown location: $1"
      return 1 ;;
  esac

  if [[ "$2" == "-i" ]]; then 
    # Open in Finder
    open "$LOC"
  else
    # Change directory and list contents
    cd "$LOC"
    l
  fi
}

