#!/bin/zsh

andy() {
  case "$1" in 
    "pl")
      br 'https://www.youtube.com/watch?v=eQPfHdiz_KI&list=PLc2Vkg57qmuRNHp6NNvYRVgg3OP-b5E_v' ;;

    "dir")
      cd /Users/arturgudiev/Programming/projects/AndyMentorship/ ;; 

    "dirgo")
      cd  /Users/arturgudiev/Programming/projects/AndyMentorship/go-hw/ ;;

    "w2test"|"w2t")
      cd /Users/arturgudiev/Programming/projects/AndyMentorship/go-hw/
      go run main.go
      ;;

    "m"|"main")
      cd  /Users/arturgudiev/Programming/projects/AndyMentorship/go-hw/; go run main.go ;;

  esac
}