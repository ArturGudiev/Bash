#!/bin/zsh
# TA - text-annotator project mediator (nodes/documents tree + annotator prototype)

TA_DIR=/Users/arturgudiev/Programming/projects/text-annotator/
TA_BACKEND_DIR=/Users/arturgudiev/Programming/projects/text-annotator/backend/
TA_FRONTEND_DIR=/Users/arturgudiev/Programming/projects/text-annotator/frontend/

ta_sql() {
    psql -U postgres -d text_annotator -c "$1";
}

ta() {
  case "$1" in

  "dir")
    cd $TA_DIR ;;

  "dirb")
    cd $TA_BACKEND_DIR ;;

  "dirf")
    cd $TA_FRONTEND_DIR ;;

  "b+"|"s+")
    cd $TA_BACKEND_DIR
    go run ./cmd/server
    ;;

  "f+"|"ui+")
    cd $TA_FRONTEND_DIR
    npm run dev
    ;;

  "tidy")
    cd $TA_BACKEND_DIR
    go mod tidy
    ;;

  "install"|"i")
    cd $TA_FRONTEND_DIR
    npm install
    ;;

  "go")
    port 5173 ;;

  "health")
    br http://localhost:8080/api/health ;;

  "sql"|"db")
    psql -U postgres -d text_annotator ;;

  "createdb"|"dbcreate")
    createdb -U postgres text_annotator ;;

  "resetdb"|"dropdb")
    ta_sql "DROP TABLE IF EXISTS texts, documents, nodes CASCADE;" ;;

  "pro")
    cursor $TA_DIR ;;

  "cp"|"commit_push")
    ta dir;
    mgit cp
    ;;

  *)
    echo "ta: unknown command '$1'" >&2
    return 1 ;;

  esac
}
