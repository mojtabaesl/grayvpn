#!/bin/bash
source "$(dirname "$BASH_SOURCE")/utils/helpers.sh"

_import "./configs/acme.sh"
_import "./tools/install.sh"
_import "./utils/guard.sh"
_import "./utils/getCertificate.sh"
_import "./tools/installDocker.sh"

_printIntro
_line
guard
_line
installTools
_line
getCertificate
_line
installDocker
_line
docker compose up -d
