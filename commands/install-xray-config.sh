#!/bin/bash

_import "/common/helpers.sh"

_install-xray-config() {
  local xrayConfigFile="./export/xray-config.json"
  if [[ -f "$xrayConfigFile" ]]; then
    mkdir -p /etc/xray
    cp $xrayConfigFile /etc/xray/config.json
    _success "Installing xray config was successful"
  else
    _error "Missing ~/configs/config.json file! :("
    exit 0
  fi
}
