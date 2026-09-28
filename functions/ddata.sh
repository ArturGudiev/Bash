#!/bin/zsh
# Dashboard data sync helpers (rclone bisync + yandex-crypt TNO)

_ddata_root="/Users/arturgudiev/Data"
_ddata_script="$_ddata_root/sync-dashboard.sh"
_ddata_dir_a="$_ddata_root/dashboard_files"
_ddata_dir_b="$_ddata_root/dashboard_files_another"
_ddata_crypt_pwd="$_ddata_root/.dashboard-sync/crypt-password.txt"
_ddata_sftp_remote="yandex-vm"
_ddata_crypt_remote="yandex-crypt"

_ddata_run() {
  if [[ ! -x "$_ddata_script" ]]; then
    echo "ddata: script not found or not executable: $_ddata_script" >&2
    return 1
  fi
  "$_ddata_script" "$@"
}

_ddata_status() {
  echo "=== ddata status ==="
  echo "script:  $_ddata_script"
  echo "dir A:   $_ddata_dir_a"
  echo "dir B:   $_ddata_dir_b"
  echo "crypt pwd backup: $_ddata_crypt_pwd"
  echo

  if command -v rclone >/dev/null 2>&1; then
    echo "rclone:  $(rclone version 2>/dev/null | head -n1)"
  else
    echo "rclone:  NOT FOUND (brew install rclone)"
  fi
  echo

  for d in "$_ddata_dir_a" "$_ddata_dir_b"; do
    if [[ -d "$d" ]]; then
      local _n
      _n=$(find "$d" -type f ! -name '.DS_Store' 2>/dev/null | wc -l | tr -d ' ')
      echo "ok  $d  ($_n files)"
    else
      echo "MISSING  $d"
    fi
  done

  if [[ -f "$_ddata_crypt_pwd" ]]; then
    echo "ok  crypt password backup"
  else
    echo "MISSING  crypt password backup"
  fi
  echo

  if command -v rclone >/dev/null 2>&1; then
    echo "--- remotes ---"
    rclone listremotes 2>/dev/null || true
    echo
    if rclone listremotes 2>/dev/null | grep -qx "${_ddata_crypt_remote}:"; then
      echo "crypt remote '${_ddata_crypt_remote}:' configured"
      echo "listing crypt root (decrypted view):"
      rclone lsd "${_ddata_crypt_remote}:" 2>&1 | head -n 20 || true
    else
      echo "crypt remote '${_ddata_crypt_remote}:' NOT configured"
      echo "run: ddata setup"
    fi
    echo
    if rclone listremotes 2>/dev/null | grep -qx "${_ddata_sftp_remote}:"; then
      echo "sftp remote '${_ddata_sftp_remote}:' configured"
      rclone lsd "${_ddata_sftp_remote}:Dashboard" 2>&1 | head -n 20 || true
    else
      echo "sftp remote '${_ddata_sftp_remote}:' NOT configured"
    fi
  fi
}

ddata() {
  case "$1" in
    ""|"sync")
      _ddata_run
      ;;

    "force"|"syncf"|"f")
      _ddata_run --force
      ;;

    "dry"|"dry-run"|"sync-dry")
      _ddata_run --dry-run
      ;;

    "resync")
      _ddata_run --resync
      ;;

    "resyncf"|"resync-force")
      _ddata_run --resync --force
      ;;

    "local"|"local-only")
      _ddata_run --local-only
      ;;

    "setup"|"setup-remote")
      _ddata_run --setup-remote
      ;;

    "status"|"st"|"info")
      _ddata_status
      ;;

    "pwd"|"syncpwd"|"password")
      if [[ ! -f "$_ddata_crypt_pwd" ]]; then
        echo "ddata: password file missing: $_ddata_crypt_pwd" >&2
        return 1
      fi
      more "$_ddata_crypt_pwd"
      ;;

    "data"|"dir"|"dira")
      cd "$_ddata_dir_a"
      ;;

    "dirb"|"another")
      cd "$_ddata_dir_b"
      ;;

    "root")
      cd "$_ddata_root"
      ;;

    "script")
      echo "$_ddata_script"
      ;;

    "help"|"-h"|"--help")
      cat <<'EOF'
ddata — dashboard_files rclone sync helpers

  ddata / ddata sync         A <-> B, then A <-> encrypted remote
  ddata force | syncf | f    same with --force
  ddata dry | dry-run        preview only
  ddata resync               first run / after conflict / big replace
  ddata resyncf              --resync --force
  ddata local | local-only   skip remote (A <-> B only)
  ddata setup                show remotes / setup hints

  ddata status | st          dirs, remotes, crypt connectivity
  ddata pwd | syncpwd        show crypt password backup
  ddata data | dir           cd dashboard_files
  ddata dirb                 cd dashboard_files_another
  ddata root                 cd /Users/arturgudiev/Data
  ddata script               print path to sync-dashboard.sh

Remote stays Trust-No-One encrypted via yandex-crypt (*.bin on VM).
EOF
      ;;

    *)
      echo "ddata: unknown command '$1'" >&2
      echo "Try: ddata help" >&2
      return 1
      ;;
  esac
}
