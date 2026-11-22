#!/bin/zsh
# mbw - Bitwarden CLI helpers

mbw() {
  case "$1" in
    "items")
      bw list items | jq -r '.[] | select(.type == 1) | "\(.name)\t\(.id)"' ;;

    "login")
      local email="${2:-arturgudiev93@gmail.com}"
      local session vault_status
      vault_status=$(bw status 2>/dev/null | jq -r '.status // "unauthenticated"')
      case "$vault_status" in
        unauthenticated)
          session=$(bw login "$email" --raw) || return 1
          ;;
        locked)
          # Already logged in — unlock for a session key
          session=$(bw unlock --raw) || return 1
          ;;
        unlocked)
          if [[ -n "${BW_SESSION:-}" ]]; then
            echo "Already unlocked (BW_SESSION set)."
            return 0
          fi
          session=$(bw unlock --raw) || return 1
          ;;
        *)
          session=$(bw login "$email" --raw) || session=$(bw unlock --raw) || return 1
          ;;
      esac
      export BW_SESSION="$session"
      echo "BW_SESSION set for this shell."
      ;;

    "session"|"key"|"env")
      local key="${2:-}"
      if [[ -z "$key" ]]; then
        echo -n "BW_SESSION: "
        read -r key
      fi
      if [[ -z "$key" ]]; then
        echo "mbw: session key required" >&2
        return 1
      fi
      export BW_SESSION="$key"
      echo "BW_SESSION set for this shell."
      ;;

    "pwdi")
      local selected id name password secure=false
      case "${2:-}" in
        secure|-s|--secure) secure=true ;;
      esac
      selected=$(
        bw list items \
          | jq -r '.[] | select(.type == 1) | "\(.name)\t\(.id)"' \
          | fzf --prompt='Bitwarden> ' --with-nth=1 --delimiter=$'\t'
      )
      [[ -n "$selected" ]] || return 0
      name="${selected%%$'\t'*}"
      id="${selected##*$'\t'}"
      password=$(bw get password "$id") || return 1
      echo "$name"
      if $secure; then
        print -n -- "$password" | pbcopy
        printf '\n\t%s\n\n' "$(printf '%*s' ${#password} '' | tr ' ' '*')"
      else
        ec "$password"
      fi
      ;;

    *)
      echo "mbw: unknown command '$1'" >&2
      echo "Usage: mbw <login|items|session|pwdi [secure]>" >&2
      return 1 ;;
  esac
}
