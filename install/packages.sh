#!/bin/bash

_install-packages() {
  tools=(
    wget
    curl
    socat
    htop
    vim
    ca-certificates
    gnupg
    lsb-release
  )

  apt-get update -y

  for pkg in "${tools[@]}"; do
    pkg_name=$(echo "$pkg" | awk '{print $1}')
    _neutral "\nInstalling $pkg_name ...\n"
    apt-get install "$pkg_name" -y >/dev/null
    _green "Done.\n"
  done
}
