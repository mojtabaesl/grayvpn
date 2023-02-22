#!/bin/bash

_check-package-manager() {
  if ! _exists apt-get; then
    _error "\nThis script needs debian based distro with 'apt' package manager!"
    exit 0
  fi
}
