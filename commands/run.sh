#!/bin/bash

_import "/install/index.sh"
_import "/guards/index.sh"
_import "/utils/getCertificate.sh"
_import "/commands/install-xray-config.sh"

_run() {
  _guard
  _line
  install
  _line
  _install-xray-config
  _line
  getCertificate
  _line
  docker compose up -d
}
