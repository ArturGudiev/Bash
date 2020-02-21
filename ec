#!/bin/bash
echo -n "$@" | xclip -selection c
printf '\n\t%s\n\n' $@
