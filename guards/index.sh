#!/bin/bash
_import "/guards/guard.sh"

_guard() {
  _emptyRow
  _check-root-user
  _check-logs-dir
  checkPackageManager
  checkENV
  _line
  printENV
  _emptyRow
  confirmENV
}
