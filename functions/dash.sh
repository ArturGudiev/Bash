#!/bin/zsh

DASH_BACKEND_DIR=/Users/arturgudiev/Programming/projects/dashboard-go/
DASH_FRONTEND_DIR=/Users/arturgudiev/Programming/projects/dashboard-ui/
DASH_DATA_DIR=/Users/arturgudiev/Programming/projects/dashboard-ui/

dash() {
  case "$1" in 

  "cp"|"commit_push")
    dash dirf; 
    mgit cp; 
    dash dirb;
    mgit cp;
    
  ;;

  "cpr") 
    # commit and push frontend and backend from local; update remote 
    dash dirf; 
    mgit cp; 
    dash dirb;
    mgit cp;
    yavm rc "da ubf"
  ;;


  "update_remote") 
    yavm rc "da ubf"
  ;;

  "syncpwd")
    more /Users/arturgudiev/Data/.dashboard-sync/crypt-password.txt ;;

  "sync")
    /Users/arturgudiev/Data/sync-dashboard.sh ;;    
  
  "syncf")
    /Users/arturgudiev/Data/sync-dashboard.sh --force ;;

  "sync-dry")
  /Users/arturgudiev/Data/sync-dashboard.sh --dry-run ;;

  "data")
    cd /Users/arturgudiev/Data/dashboard_files ;;

  "dirb")
    cd $DASH_BACKEND_DIR ;;

  "dirf")
    cd $DASH_FRONTEND_DIR ;;
    
  "swagger")
    br http://localhost:8080/swagger/index.html ;;
    
  "go")
    port 4200 ;;

  "swagger_build"|"swagb"|"swag_init")
    dash dirb; 
    swag init
  ;;

  "b+"|"s+")
    cd $DASH_BACKEND_DIR
    go run . 
    ;;

  "f+"|"ui+")
    dash dirf
    npm start ;;

  "generate_types"|"generate-ui")
    cd /Users/arturgudiev/Programming/projects/dashboard-ui/src/app/types/;
    rm -rf ./generated;
    npx @hey-api/openapi-ts -i /Users/arturgudiev/Programming/projects/dashboard-go/docs/swagger.json -o ./generated
  ;;

  "go-generate"|"generate-go")
    cd /Users/arturgudiev/Programming/projects/dashboard-go/ent/
    go generate .
  ;;

  "wire")
    cd /Users/arturgudiev/Programming/projects/dashboard-go/app/
    wire
  ;;

  "swag_init")
    cd /Users/arturgudiev/Programming/projects/dashboard-go/
    swag init
  ;;

  "generate-2")
    dash generate-go;
    echo -n "'Generate backend' finished. Press [Enter] to continue..."; read
    
    dash swag_init;
    echo -n "'Swag init' finished. Press [Enter] to continue..."; read
    
    dash generate-ui;
    ;;

  "sql"|"db")
    psql -U postgres -d dashboard ;;

  esac
}