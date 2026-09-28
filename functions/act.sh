#!/bin/zsh
# ACT - Activities project mediator

ACT_DIR=/Users/arturgudiev/Programming/projects/Activities/

act() {
  case "$1" in

  "dir")
    cd $ACT_DIR ;;

  "+"|"start")
    cd $ACT_DIR
    npm run dev ;;

  "build")
    cd $ACT_DIR
    npm run build ;;

  "generate")
    cd $ACT_DIR
    npm run generate ;;

  "preview")
    cd $ACT_DIR
    npm run preview ;;

  "cp"|"commit_push")
    act dir;
    mgit cp
    ;;

  *)
    echo "act: unknown command '$1'" >&2
    return 1 ;;

  esac
}
