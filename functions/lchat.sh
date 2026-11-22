#!/bin/zsh
# Local chat - navigation and commands for the branching chat app

LCHAT_ROOT=/Users/arturgudiev/Programming/projects/AI/chat
LCHAT_BACKEND=$LCHAT_ROOT/backend
LCHAT_FRONTEND=$LCHAT_ROOT/frontend

lchat() {
  case "$1" in
    "dir")
      cd "$LCHAT_ROOT" ;;

    "dirb")
      cd "$LCHAT_BACKEND" ;;

    "dirf")
      cd "$LCHAT_FRONTEND" ;;

    "b+")
      cd "$LCHAT_BACKEND"
      source .venv/bin/activate
      # Reload would restart the Cursor bridge in the middle of a chat.
      uvicorn app.main:app --host 0.0.0.0 --port 8010 ;;

    "f+")
      cd "$LCHAT_FRONTEND"
      npm run dev ;;

    "go")
      port 5173 ;;

    "cursor"|"pro")
      cursor -n --classic "$LCHAT_FRONTEND" "$LCHAT_BACKEND" ;;

    *)
      echo "lchat: unknown command '$1'" >&2
      echo "Usage: lchat <dir|dirb|dirf|b+|f+|go|cursor>" >&2
      return 1 ;;
  esac
}
