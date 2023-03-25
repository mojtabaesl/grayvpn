#!/bin/bash

_import "/install/install.sh"
_import "/guards/guard.sh"
_import "/utils/get-certificate.sh"
_import "/commands/install-xray-config.sh"
_import "/commands/install-www.sh"

_run() {
  _guard
  _line
  _install
  _line
  _install-www
  _line
  _get-certificate
  _line
  docker compose up -d
}
