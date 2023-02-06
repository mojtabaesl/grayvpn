#!/bin/bash

initAcme() {
  curl https://get.acme.sh | sh
  ~/.acme.sh/acme.sh --set-default-ca --server letsencrypt
  ~/.acme.sh/acme.sh --register-account -m $EMAIL
}

requestCertificate() {
  local fullchain_file="$CERTS_PATH/$FULLCHAIN_FILE"
  local key_file="$CERTS_PATH/$KEY_FILE"

  ~/.acme.sh/acme.sh --issue -d $DOMAIN --standalone
  ~/.acme.sh/acme.sh --installcert -d $DOMAIN --key-file $key_file --fullchain-file $fullchain_file --reloadcmd "docker restart grayvpn-xray-1"
}

getCertificate() {
  initAcme
  requestCertificate
}
