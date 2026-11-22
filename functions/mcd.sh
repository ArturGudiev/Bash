#!/bin/zsh
# mcd - change directory; joins all args into one path (spaces ok)

mcd() {
  local target

  if (( $# > 0 )); then
    target="$*"
  else
    echo -n "Directory: "
    read -r target
  fi

  if [[ -z "$target" ]]; then
    echo "mcd: no directory provided" >&2
    return 1
  fi

  cd "$target" || return 1
}
