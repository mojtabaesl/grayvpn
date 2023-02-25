#!/bin/bash

_import "/guards/check-env.sh"
_import "/guards/check-logs-dir.sh"
_import "/guards/check-package-manager.sh"
_import "/guards/check-root.sh"
_import "/guards/check-configs.sh"
_import "/guards/check-www.sh"

_guard() {
  _check-configs
  _check-root-user
  _check-logs-dir
  _check-www
  _check-package-manager
  _check-env
  _line
  _print-env
  _emptyRow
  _confirm-env
}
