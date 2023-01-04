#!/bin/bash
ROOT_DIR=$(dirname "$BASH_SOURCE")
. "$ROOT_DIR/utils.sh"

title "Updating OS"

apt update && apt upgrade -y

progress "OS has been updated"