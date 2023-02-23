#!/bin/bash

_import "/common/helpers.sh"

_check-configs() {
  local grayvpnrc="$HOME/configs/grayvpnrc.sh"
  if [[ ! -f "$grayvpnrc" ]]; then
    _warn "Missing grayvpnrc.sh file, you need to insert information manually!"
  else
    source "$grayvpnrc"
  fi
}
