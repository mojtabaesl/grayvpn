#!/bin/bash

_import "/guards/check-env.sh"
_import "/common/helpers.sh"
_import "/utils/get-certificate.sh"
_import "/guards/check-configs.sh"

_get-new-certificate() {
  _check-configs
  _check-env
  _line
  _print-env
  _emptyRow
  _confirm-env
  _request-certificate
}
