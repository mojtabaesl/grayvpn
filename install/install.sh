#!/bin/bash

_import "/install/docker.sh"
_import "/install/packages.sh"

_install() {
  _install-packages
  _install-docker
}
