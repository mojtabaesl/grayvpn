#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing Xray"

bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install -u root

progress "Xray has been installed"