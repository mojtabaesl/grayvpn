#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing Snap core"

snap install core

progress "Snap core has been installed"