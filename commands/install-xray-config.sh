#!/bin/bash

_install-xray-config() {
  local xrayConfigFile="$HOME/configs/config.json"
  if [[ -f "$xrayConfigFile" ]]; then
    mkdir -p /etc/xray
    cp $xrayConfigFile /etc/xray/config.json
    _green "Installing xray config was successful"
  else
    _red "Missing ~/configs/config.json file! :(\n"
    exit 0
  fi
}
