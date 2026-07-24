#!/bin/zsh
# HP2 - Work-related navigation and commands for HP / chp_api project

_hpapi_dir="/Users/arturgudiev/Programming/Job/chp_api"

_hpapi_run() {
  cd "$_hpapi_dir" || return 1
  npm run dev -- "$@"
}

_hpapi_login() {
  _hpapi_run --login "$1"
}

hpapi() {
  case "$1" in
    "api"|"")
      node "$_hpapi_dir/dist/index.js"
      ;;

    # Predefined logins (same ids as chp_api --login / --list-logins)
    "mina"|"admin-minzhkh")
      _hpapi_login admin-minzhkh
      ;;
    "minh"|"head-minzhkh")
      _hpapi_login head-minzhkh
      ;;
    "mino"|"op-minzhkh")
      _hpapi_login op-minzhkh
      ;;
    "isca"|"admin-isc")
      _hpapi_login admin-isc
      ;;
    "isco"|"op-isc")
      _hpapi_login op-isc
      ;;
    "ross"|"admin-rosseti")
      _hpapi_login admin-rosseti
      ;;
    "plat"|"admin-platform")
      _hpapi_login admin-platform
      ;;

    "login"|"-l")
      if [[ -z "$2" ]]; then
        echo "Usage: hpapi login <id>"
        echo "       hpapi list"
        return 1
      fi
      _hpapi_login "$2"
      ;;

    # One-shot: hpapi incident <id> [login]
    # e.g. hpapi incident 42 isca
    "incident"|"incident-by-id")
      if [[ -z "$2" ]]; then
        echo "Usage: hpapi incident <incident_id> [login]"
        echo "  e.g. hpapi incident 42 isca"
        return 1
      fi
      local incident_id="$2"
      local login_id="${3:-isca}"
      _hpapi_run --incident-by-id "$incident_id" --login "$login_id"
      ;;

    "me")
      local login_id="${2:-isca}"
      _hpapi_run --me --login "$login_id"
      ;;

    "--list-logins"|"list"|"logins")
      _hpapi_run --list-logins
      ;;

    "dir")
      cd "$_hpapi_dir"
      ;;

    "pro")
      cursor "$_hpapi_dir"
      ;;

    "compile")
      cd "$_hpapi_dir" || return 1
      tsc
      ;;

    "help"|"-h"|"--help")
      cat <<'EOF'
hpapi — CHP API CLI helpers

  hpapi / hpapi api              Run built CLI (no auto-login)
  hpapi dir                      cd to chp_api
  hpapi pro                      Open in Cursor
  hpapi compile                  tsc build
  hpapi list                     List predefined login ids
  hpapi login <id>               Start CLI logged in as <id>

One-shot methods (login → call → print → quit):
  hpapi incident <id> [login]    GET incident by id  (default login: isca)
  hpapi me [login]               GET /users/me       (default login: isca)

  e.g. hpapi incident 42 isca
       hpapi me mina

Predefined shortcuts:
  mina / admin-minzhkh     Админ МинЖКХ
  minh / head-minzhkh      Руководитель МинЖКХ
  mino / op-minzhkh        Оператор МинЖКХ
  isca / admin-isc         Админ ИСЦ
  isco / op-isc            Оператор ИСЦ
  ross / admin-rosseti     Админ Россети
  plat / admin-platform    Admin (platform)
EOF
      ;;

    *)
      echo "Unknown option: $1"
      echo "Try: hpapi help"
      return 1
      ;;
  esac
}
