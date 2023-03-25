#!/bin/bash

_import "/install/docker.sh"
_import "/install/packages.sh"
_import "/install/nodejs.sh"

_install() {
  _install-packages
  _install-nodejs
  _install-docker
}
