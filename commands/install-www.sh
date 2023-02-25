#!/bin/bash

_import "/common/helpers.sh"

_install-www() {
  cp -R ./html/* $HOME/www
}
