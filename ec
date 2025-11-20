#!/bin/zsh
echo -n "$@" | pbcopy
printf '\n\t%s\n\n' $@
