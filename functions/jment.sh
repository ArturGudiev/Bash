#!/bin/zsh
# Mentorship - Java mentorship project navigation and commands

JMENT_DIR=/Users/arturgudiev/Programming/Java/Mentorship

jment() {
  case "$1" in
    "dir")
      cd $JMENT_DIR ;;

    "pro")
      cursor -n --classic "$JMENT_DIR" ;;

    "svg1")
      open "$JMENT_DIR/class-diagram-full.svg" ;;


    # "svg1")
    #   open "$JMENT_DIR/class-diagram-full-dark.svg" ;;

    "svg12")
      open "$JMENT_DIR/class-diagram-full-dark.svg" ;;


    "svg2")
      open "$JMENT_DIR/ERD.svg" ;;

    *)
      echo "jment: unknown command '$1'" >&2
      echo "Usage: jment <dir|pro|svg1|svg2>" >&2
      return 1 ;;
  esac
}
