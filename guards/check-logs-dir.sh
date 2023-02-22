#!/bin/bash

_import "/common/helpers.sh"

_check-logs-dir() {
  if [[ ! -d "/etc/xray/logs" ]]; then
    mkdir -p /etc/xray/logs >/dev/null 2>&1
    if [[ $? == 0 ]]; then
      _success "Xray logs directory has been created successfully (/etc/xray/logs)"
    fi
    _error "Can not create directory /etc/xray/logs"
    exit 0
  fi
}
