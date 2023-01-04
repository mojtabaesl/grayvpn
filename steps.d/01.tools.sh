#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

tools=(
  nginx
  curl
  snapd
  sed
)

title "Installing necessary tools..."

for pkg in "${desktop[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  progress "Installing $pkg_name"
  apt install "$pkg" -y > /dev/null
done