#!/bin/zsh
# Memory Guard original (memory-guard-original)

MGO_DIR=/Users/arturgudiev/Programming/projects/memory-guard-original
MGO_FRONTEND_DIR=$MGO_DIR/memory-guard-ui/

memo() {
  case "$1" in
    "f+"|"ui+")
      cd "$MGO_FRONTEND_DIR"
      npm start
      ;;

    "dirf")
      cd "$MGO_FRONTEND_DIR" ;;

    "dir")
      cd "$MGO_DIR" ;;

    "go")
      port 4200 ;;

    "go2")
      br https://memoryguard.ru ;;

    "monitor")
      br https://dashboard.uptimerobot.com/monitors ;;

    *)
      echo "memo: unknown command '$1'" >&2
      echo "Usage: memo <dir|dirf|f+|ui+|go|go2|monitor>" >&2
      return 1 ;;
  esac
}
