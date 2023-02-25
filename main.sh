#!/bin/bash
source "$(dirname "$BASH_SOURCE")/common/helpers.sh"

_import "/commands/run.sh"
_import "/commands/install-xray-config.sh"
_import "/commands/get-new-certificate.sh"

_printIntro
_line
_option "1" "Install"
_option "2" "Install Xray config"
_option "3" "Get new certificate"
_option "4" "Restart Xray"
_option "5" "Restart Nginx"
_option "6" "Generate subscription files"
_option "7" "Install subscription files"
_option "0" "Exit"
_emptyRow

# _option "?" "Remove"
# _option "?" "Renew existing certificate"
# _option "?" "Renew existing certificate"

read -p "Please select one of the options [number]: " OPTION_NUMBER

case "${OPTION_NUMBER}" in
0)
  exit 0
  ;;
1)
  _run
  ;;
2)
  _install-xray-config
  ;;
3)
  _get-new-certificate
  ;;
4)
  docker compose restart xray
  ;;
5)
  docker compose restart nginx
  ;;
6)
  node generateSubLinks.mjs
  ;;
7)
  cp -R ./export/subs/* $HOME/www
  ;;
*)
  _warn "Not found in options"
  ;;

esac
