#! /bin/bash

_install-nodejs() {
  curl -fsSL https://deb.nodesource.com/setup_19.x | bash - &&
    apt-get install -y nodejs
}
