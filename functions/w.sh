#!/bin/zsh
# HP2 - Work-related navigation and commands for HP project

w() {
  echo 'LOCAL VERSION ---- !!!! Attention' 
  dash dirb;
  go run . cli --alias $1;
}


wr() {
  dash dirb;
  # echo "go run . cli --remote "ssh://arturgudiev@$YIP" --alias $1;"
  go run . cli --remote "ssh://arturgudiev@$YIP" --alias $1;
}

