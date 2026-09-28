#!/bin/zsh
# CAO - Work-related navigation and commands

CAO_ROOT=/Users/arturgudiev/Programming/Job/CAO
CAO_BACKEND=$CAO_ROOT/backend
CAO_FRONTEND=$CAO_ROOT/frontend

cao() {
  case "$1" in
    "dir"|"dirb")
      cd $CAO_BACKEND ;;

    "dirf")
      cd $CAO_FRONTEND ;;

    "b+")
      cd $CAO_BACKEND
      source venv/bin/activate
      uvicorn main:app --port 8000 --reload ;;

    "f+")
      cd $CAO_FRONTEND
      npm run dev ;;

    "alembic"|"al")
      cao dirb
      source venv/bin/activate
      alembic upgrade head ;;

    "swagger")
      open -a "Safari" 'http://localhost:8000/docs' ;;

    "swaggerjson")
      open -a "Safari" 'http://localhost:8000/openapi.json' ;;

    "go")
      port 5173 ;;

    "hub")
      br "https://github.com/Kush013/cao_fastapi/" ;;

    "pro"|"uibackc")
      cursor -n --classic "$CAO_FRONTEND" "$CAO_BACKEND" ;;

    "sql"|"db")
      psql -U postgres -d cao_backend ;;

    *)
      echo "cao: unknown command '$1'" >&2
      return 1 ;;
  esac
}
