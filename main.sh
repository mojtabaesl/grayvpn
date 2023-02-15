#!/bin/bash
source "$(dirname "$BASH_SOURCE")/common/helpers.sh"

_import "/configs/acme.sh"
_import "/commands/install.sh"
_import "/commands/install-xray-config.sh"

_printIntro
_line
_option "1" "Install"
_option "2" "Install xray config"
_option "0" "Exit"
_emptyRow

# _option "2" "Remove"
# _option "3" "Get new certificate"
# _option "4" "Renew existing certificate"

read -p "Please select one of the options [number]: " OPTION_NUMBER

case "${OPTION_NUMBER}" in
0)
  exit 0
  ;;
1)
  _cmd-install
  ;;
2)
  _install-xray-config
  ;;
*)
  _warn "Not found in options"
  ;;

esac
