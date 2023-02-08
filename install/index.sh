#!/bin/bash

_import "./docker.sh"
_import "./packages.sh"

install() {
  installPackages
  installDocker
}
