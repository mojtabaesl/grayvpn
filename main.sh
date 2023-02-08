#!/bin/bash
source "$(dirname "$BASH_SOURCE")/common/helpers.sh"

_import "/configs/acme.sh"
_import "/install/index.sh"
_import "/guards/guard.sh"
_import "/utils/getCertificate.sh"

_printIntro
_line
guard
_line
install
_line
getCertificate
_line
docker compose up -d
