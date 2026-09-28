#!/bin/zsh
# Central import file - sources all function files
# This is the "barrel export" for all custom shell functions

FUNCTIONS_DIR="$HOME/Programming/Bash/Scripts/functions"

# Source individual function files
source "$FUNCTIONS_DIR/andy.sh" # Andy
source "$FUNCTIONS_DIR/hp.sh" # CHp Mobile 
source "$FUNCTIONS_DIR/hpapi.sh" # CHp API
source "$FUNCTIONS_DIR/mgapi.sh" # Memory Guard API
source "$FUNCTIONS_DIR/cao.sh" # CAO FastAPI
source "$FUNCTIONS_DIR/dash.sh" # CHp Mobile
source "$FUNCTIONS_DIR/ddata.sh" # Dashboard data sync (rclone)
source "$FUNCTIONS_DIR/act.sh" # Activities
source "$FUNCTIONS_DIR/ges.sh" # Geshtalt
source "$FUNCTIONS_DIR/zali.sh" # Zali 
source "$FUNCTIONS_DIR/mem.sh" # Memory Guard
source "$FUNCTIONS_DIR/tpl.sh" # CHp Mobile 
source "$FUNCTIONS_DIR/w.sh" 
source "$FUNCTIONS_DIR/polka.sh" # Polka Sharp
source "$FUNCTIONS_DIR/nav.sh"
source "$FUNCTIONS_DIR/sets.sh"
source "$FUNCTIONS_DIR/utils.sh"
source "$FUNCTIONS_DIR/ta.sh" # Text Annotator

# Add more function imports here as needed:
# source "$FUNCTIONS_DIR/mcd.sh"
# etc.

