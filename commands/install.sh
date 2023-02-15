#!/bin/bash

_import "/install/index.sh"
_import "/guards/guard.sh"
_import "/utils/getCertificate.sh"
_import "/commands/install-xray-config.sh"

_cmd-install() {
  guard
  _line
  install
  _line
  _install-xray-config
  _line
  getCertificate
  _line
  docker compose up -d
}
