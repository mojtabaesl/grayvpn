#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Installing certbot"

snap install --classic certbot
ln -s /snap/bin/certbot /usr/bin/certbot
certbot certonly --nginx
certbot renew --dry-run

progress "Certificate has been installed"