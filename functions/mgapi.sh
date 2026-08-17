#!/bin/zsh
# Memory Guard API CLI helpers (mg-api)

_mgapi_dir="/Users/arturgudiev/Programming/projects/memory-guard/mg-api"

_mgapi_run() {
  cd "$_mgapi_dir" || return 1
  npm run dev -- "$@"
}

_mgapi_login() {
  _mgapi_run --login "$1"
}

mgapi() {
  case "$1" in
    "api"|"")
      node "$_mgapi_dir/dist/index.js"
      ;;

    "admin")
      _mgapi_login admin
      ;;

    "login"|"-l")
      if [[ -z "$2" ]]; then
        echo "Usage: mgapi login <id>"
        echo "       mgapi list"
        return 1
      fi
      _mgapi_login "$2"
      ;;

    "me"|"whoami"|"profile")
      local login_id="${2:-admin}"
      _mgapi_run --me --login "$login_id"
      ;;

    "roots"|"routes")
      local login_id="${2:-admin}"
      _mgapi_run --roots --login "$login_id"
      ;;

    "node"|"memory-node")
      if [[ -z "$2" ]]; then
        echo "Usage: mgapi node <id> [login]"
        echo "  e.g. mgapi node 1 admin"
        return 1
      fi
      local node_id="$2"
      local login_id="${3:-admin}"
      _mgapi_run --node "$node_id" --login "$login_id"
      ;;

    "--list-logins"|"list"|"logins")
      _mgapi_run --list-logins
      ;;

    "dir")
      cd "$_mgapi_dir"
      ;;

    "pro")
      cursor "$_mgapi_dir"
      ;;

    "compile"|"build")
      cd "$_mgapi_dir" || return 1
      npm run build
      ;;

    "help"|"-h"|"--help")
      cat <<'EOF'
mgapi — Memory Guard API CLI helpers

  mgapi / mgapi api              Run built CLI (no auto-login)
  mgapi dir                      cd to mg-api
  mgapi pro                      Open in Cursor
  mgapi compile                  npm run build
  mgapi list                     List predefined login ids
  mgapi login <id>               Start CLI logged in as <id>

One-shot methods (login → call → print → quit):
  mgapi me [login]               GET /users/me        (default login: admin)
  mgapi roots [login]            GET /memory-nodes/roots
  mgapi node <id> [login]        GET /memory-node/{id}

  e.g. mgapi me admin
       mgapi roots
       mgapi node 1 admin

Predefined shortcuts (interactive menu, logged in):
  admin                          admin / 1111
EOF
      ;;

    *)
      echo "Unknown option: $1"
      echo "Try: mgapi help"
      return 1
      ;;
  esac
}
