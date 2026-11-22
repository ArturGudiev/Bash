#!/bin/zsh
# Ledger - Spring Boot navigation and commands

LEDGER_DIR=/Users/arturgudiev/Programming/Java/ledger

led() {
  case "$1" in
    "dir")
      cd $LEDGER_DIR ;;

    "+"|"b+"|"run")
      cd $LEDGER_DIR
      ./mvnw spring-boot:run ;;

    "test"|"t")
      cd $LEDGER_DIR
      ./mvnw test ;;

    "go")
      port 8080 ;;

    "hub")
      br "https://github.com/ArturGudiev/ledger" ;;

    "pro")
      cursor -n --classic "$LEDGER_DIR" ;;

    "sql"|"db")
      psql -U postgres -d ledger ;;

    *)
      echo "ledger: unknown command '$1'" >&2
      echo "Usage: ledger <dir|+|test|go|hub|pro|sql>" >&2
      return 1 ;;
  esac
}
