#!/bin/zsh
# PAI - Petr Mentorship helpers

PAI_DIR="/Users/arturgudiev/Data/dashboard_files/knowledge-nodes/996_Petr Mentorship"

pai() {
  case "$1" in
    "dir")
      cd "$PAI_DIR" ;;

    "figma")
      br "https://www.figma.com/board/1uzK4gEqojMnIwj7IwpFK8" ;;

    *)
      echo "pai: unknown command '$1'" >&2
      echo "Usage: pai <dir|figma>" >&2
      return 1 ;;
  esac
}
