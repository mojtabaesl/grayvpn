#!/bin/bash

_import "/common/helpers.sh"

_check-www() {
  if [[ ! -d "$HOME/www" ]]; then
    mkdir -p $HOME/www >/dev/null 2>&1
    _success "Nginx www directory has been created successfully ($HOME/www)"
  fi
}
