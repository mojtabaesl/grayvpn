#!/bin/bash

_import "/install/docker.sh"
_import "/install/packages.sh"

install() {
  installPackages
  installDocker
}
