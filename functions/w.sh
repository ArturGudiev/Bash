#!/bin/zsh
# HP2 - Work-related navigation and commands for HP project

w() {
  echo 'LOCAL VERSION ---- !!!! Attention' 
  dash dirb;
  go run . cli --alias $1;
}


wr() {
  dash dirb;
  go run . cli --remote ssh://arturgudiev@158.160.36.7 --alias $1;
}

