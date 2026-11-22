#!/bin/zsh

pgo_dir="/Users/arturgudiev/Programming/Practice/practice-go/"

pgo() {
  case "$1" in 
    "dir")
      cd "$pgo_dir" ;; 

    "+")
      cd "$pgo_dir/" 
      go run main.go "$2"
      ;;

    "cpa")
      cd "$pgo_dir/" 
      mgit cpa
      ;;

    "stash"|"st")
      cd "$pgo_dir/" 
      git stash
      ;;


  esac
}