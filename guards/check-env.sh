#!/bin/bash

_check-env() {

  if [[ $EMAIL == "" ]]; then
    read -p "Enter your Email: " __EMAIL

    export EMAIL=$__EMAIL
  fi

  if [[ $DOMAIN == "" ]]; then
    read -p "Enter your domain name: " __DOMAIN
    export DOMAIN=$__DOMAIN
  fi

  if [[ $CERTS_PATH == "" ]]; then
    read -p "Enter path to save certificates (default: /etc/xray/certs): " __CERTS_PATH
    if [[ $__CERTS_PATH == "" ]]; then
      export CERTS_PATH=/etc/xray/certs
    else
      export CERTS_PATH=$__CERTS_PATH
    fi
    mkdir -p $CERTS_PATH
  fi

  if [[ $KEY_FILE == "" ]]; then
    read -p "Enter file name to save key (default: private.key): " __KEY_FILE
    if [[ $__KEY_FILE == "" ]]; then
      export KEY_FILE=private.key
    else
      export KEY_FILE=$__KEY_FILE
    fi
  fi

  if [[ $FULLCHAIN_FILE == "" ]]; then
    read -p "Enter file name to save cert (default: cert.crt): " __FULLCHAIN_FILE
    if [[ $__FULLCHAIN_FILE == "" ]]; then
      export FULLCHAIN_FILE=cert.crt
    else
      export FULLCHAIN_FILE=$__FULLCHAIN_FILE
    fi
  fi
}

_print-env() {
  _line
  _neutral "Domain name:             $(_blue "$DOMAIN\n")"
  _neutral "Email:                   $(_blue "$EMAIL\n")"
  _neutral "Certificates file path:  $(_blue "$CERTS_PATH\n")"
  _neutral "Fullchain file name:     $(_blue "$FULLCHAIN_FILE\n")"
  _neutral "Key file name:           $(_blue "$KEY_FILE\n")"
}

_confirm-env() {
  read -p "Do you want to continue with these information? (y/n) " ANSWER
  if [[ $ANSWER != "y" ]]; then
    _yellow "See you later! (o_O)"
    exit 0
  fi
}
