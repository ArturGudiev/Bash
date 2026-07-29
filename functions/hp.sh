#!/bin/zsh
# HP2 - Work-related navigation and commands for HP project

hp_sql() {
    psql -U postgres -d chpo -c "$1"; 
}

hp() {
  case "$1" in 
    "alembic"|"al")
      hp dirb;
      source venv/bin/activate;
      alembic upgrade head
      ;;

    "api")
      node /Users/arturgudiev/Programming/Job/chp_api/dist/index.js
      ;;

    "dir")
      cd /Users/arturgudiev/Programming/Job/chp_online_mobile ;;
    
    "dirb")
      cd /Users/arturgudiev/Programming/Job/CHPOnline/ ;;


    "dirf")
      cd /Users/arturgudiev/Programming/Job/frontend/CHPOnline/ ;;


    "apk")
      cd /Users/arturgudiev/Programming/Job/chp_online_mobile/build/app/outputs/flutter-apk ;;


    "dirb")
      cd /Users/arturgudiev/Programming/Job/CHPOnline/ ;;


    "b+")
      cd /Users/arturgudiev/Programming/Job/CHPOnline/
      source venv/bin/activate
      uvicorn main:app --port 8000 --reload ;;

    "f+")
      cd /Users/arturgudiev/Programming/Job/frontend/CHPOnline/ ;
      npm run dev ;;

    "m+")
      hp dir;
      flutter run ;;

    "ml+")
      hp dir;
      flutter run -d EA7FE8FA-DC4C-416A-BA6E-174311E43CC2 ;;

    "android+"|"android_build"|"abuild"|"a_build")
      cd /Users/arturgudiev/Programming/Job/chp_online_mobile/ ;
      flutter build apk ;;

    "android_dir"|"a_dir")
      cd /Users/arturgudiev/Programming/Job/chp_online_mobile/build/app/outputs/flutter-apk/ ;
      ;;

    "copy_android"|"cp_android")
      cp /Users/arturgudiev/Programming/Job/chp_online_mobile/build/app/outputs/flutter-apk/app-release.apk $2 ;;

    "rune"|"runemulator")
      cd /Users/arturgudiev/Programming/Job/chp_online_mobile/ ;
      flutter run -d EA7FE8FA-DC4C-416A-BA6E-174311E43CC2 ;;

    "cpapk")
      cp /Users/arturgudiev/Programming/Job/chp_online_mobile/build/app/outputs/flutter-apk/app-release.apk $2 ;;

    "m+")
      cd /Users/arturgudiev/Programming/Job/chp_online_mobile/ ;
      flutter run -d EA7FE8FA-DC4C-416A-BA6E-174311E43CC2;;

    "go")
      port 5173 ;;

    "swagger")
      open -a "Safari" 'http://localhost:8000/docs' ;;
    
    "swaggerjson")
      open -a "Safari" 'http://localhost:8000/openapi.json' ;;

    "hub")
      br "https://github.com/Kush013/CHPOnline#" ;;

    "pr")
      br "https://github.com/Kush013/chp_online_mobile/pulls" ;;

    "pr2")
      br "https://github.com/Kush013/CHPOnline/pulls" ;;

    "releases")
      br "https://github.com/Kush013/CHPOnline/pulls" ;;

    "hub2")
      br "https://github.com/Kush013/chp_online_mobile" ;;

    "iphone" | "iphone_release")
      hp dir; flutter run --release -d 00008030-000268DE0C63802E ;;

    "iphoned" | "iphone_debug")
      hp dir; flutter run --debug -d 00008030-000268DE0C63802E ;;


    "figma")
      open -a "Safari" 'https://www.figma.com/design/Z5XpqNHhROerYLdU2UIVjb/%D0%9C%D0%B8%D0%BD%D0%B8%D1%81%D1%82%D0%B5%D1%80%D1%81%D1%82%D0%B2%D0%BE-%D0%96%D0%9A%D0%A5-%D0%A0%D0%A1%D0%9E-%D0%90%D0%BB%D0%B0%D0%BD%D0%B8%D1%8F?node-id=0-1&p=f&t=FSkoxucwgnAUb1XB-0' ;;

    "pro")
      code "/Users/arturgudiev/Programming/Job/chp_online_mobile" ;;

    "gile")
      br https://ru.yougile.com/team/248e303b8e99/%D0%A6%D0%B8%D1%84%D1%80%D0%BE%D0%B2%D0%BE%D0%B9-%D0%BE%D0%BF%D0%B5%D1%80%D1%88%D1%82%D0%B0%D0%B1 ;;
    
    "address"|"addr")
      ec "Владикавказ ул Куйбышева 134 д 4 " ;;

    "address_json"|"addr_json")
      code /Users/arturgudiev/Programming/Job/Data/address.json ;;


    "address2"|"addr2")
      ec "Владикавказ ул Чапаева 17 " ;;
    
    "addr3")
      ec "Владикавказ ул Московская д 17 " ;;

    "move_to_icons"|"move_icons"|"move_icon")
      mv $2 /Users/arturgudiev/Programming/Job/chp_online_mobile/assets/images/icons ;;

    "sql"|"db")
      psql -U postgres -d chpo ;;

    "test1")
      hp dir;
      flutter test test/pages/login_page_test.dart;
      ;;

     "test2")
        hp dir;
        flutter test test/pages/main_page_test.dart;
    ;;

    "uibackc"|"uiback_cursor")
      cursor  /Users/arturgudiev/Programming/Job/frontend/CHPOnline/ /Users/arturgudiev/Programming/Job/CHPOnline/ ;;
  
    "sqlfunctions"|"sqlf")
      psql -U postgres  -d chpo -f /Users/arturgudiev/Programming/Job/SQL/chp.sql ;;

    "sqlfc"|"psqlfc")
      if [[ -n "$2" ]]; then
        expression="$2"
      else
        read "?Get sql expression (function call): " expression
      fi
      [[ -n "$expression" ]] || { echo "hp sqlfc: expression required" >&2; return 1; }
      psql -U postgres -d chpo -c "SELECT ($expression).*" ;;

    "update_openapi")
      curl http://localhost:8000/openapi.json -o /Users/arturgudiev/Programming/Job/chp_online_mobile/assets/openapi.json
    ;;

    "generate_types")
      curl http://localhost:8000/openapi.json -o /Users/arturgudiev/Programming/Job/chp_online_mobile/assets/openapi.json;
      echo -n "Press [Enter] to continue..."; read
      hp dir; 
      dart run swagger_parser;
      echo -n "Press [Enter] to continue..."; read
      dart run build_runner clean;
      echo -n "Press [Enter] to continue..."; read
      dart run build_runner build --delete-conflicting-outputs
    ;;

    "sqlfc2"|"psqlfc2")
      if [[ -n "$2" ]]; then
        expression="$2"
      else
        read "?Get sql expression (function call): " expression
      fi
      [[ -n "$expression" ]] || { echo "hp sqlfc: expression required" >&2; return 1; }
      psql -U postgres -d chpo -c "SELECT $expression" ;;

    *)
      echo "hp: unknown command '$1'" >&2
      return 1 ;;
  esac
}