#!/bin/bash
_import "/guards/guard.sh"

_guard() {
  _emptyRow
  _check-root-user
  checkPackageManager
  checkENV
  _line
  printENV
  _emptyRow
  confirmENV
}
