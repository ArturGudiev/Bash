#!/bin/zsh
# Quick Question - ask Cursor from the terminal

QQ_DIR=/Users/arturgudiev/Programming/projects/AI/quick-question

qq() {
  case "$1" in
    "dir")
      cd "$QQ_DIR" ;;

    "+")
      cd "$QQ_DIR"
      shift
      .venv/bin/python ask.py "$@" ;;

    "pro")
      cursor -n --classic "$QQ_DIR" ;;
       
    "window")
      /Users/arturgudiev/Programming/projects/AI/QuickQuestion/qq ;;

    *)
      echo "qq: unknown command '$1'" >&2
      echo "Usage: qq <dir|+|pro>" >&2
      return 1 ;;
  esac
}
