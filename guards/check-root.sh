#!/bin/bash

_import "/common/helpers.sh"

_check-root-user() {
  if [[ $USER != "root" ]]; then
    _error "Please login as root user!"
    exit 0
  fi
}
