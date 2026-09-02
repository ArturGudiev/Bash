#!/bin/zsh
# HP2 - Work-related navigation and commands for HP project

w() {
  dash dirb;
  go run . cli --alias $1;
}

