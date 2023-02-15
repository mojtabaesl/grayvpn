#!/bin/bash

_import "/common/helpers.sh"

_check-logs-dir() {
  if [[ ! -d "/etc/xray/logs" ]]; then
    mkdir /etc/xray/logs
    _success "Xray logs directory has been created successfully (/etc/xray/logs)"
  fi
}
