#!/bin/zsh


cao() {
  case "$1" in 
    "hub")
      br "https://github.com/Kush013/cao_fastapi/" ;;

    *)
      echo "hp: unknown command '$1'" >&2
      return 1 ;;
  esac
}