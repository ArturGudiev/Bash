#!/bin/zsh
# GES - Geshtalt project mediator

GES_DIR=/Users/arturgudiev/Programming/projects/geshtalt/

ges() {
  case "$1" in

  "dir")
    cd $GES_DIR ;;

  "+"|"start")
    cd $GES_DIR
    npm run dev ;;

  "build")
    cd $GES_DIR
    npm run build ;;

  "prod"|"start:prod")
    cd $GES_DIR
    npm run start:prod ;;

  "f+"|"frontend")
    cd $GES_DIR
    npm run frontend:dev ;;

  "fbuild"|"frontend:build")
    cd $GES_DIR
    npm run frontend:build ;;

  "cp"|"commit_push")
    ges dir;
    mgit cp
    ;;

  *)
    echo "ges: unknown command '$1'" >&2
    return 1 ;;

  esac
}
