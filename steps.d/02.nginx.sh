#!/bin/bash
. "$(dirname "$BASH_SOURCE")/../utils.sh"

title "Adding domain name to nginx config"

FILE="/etc/nginx/sites-available/default"

if [ -f "$FILE" ]; then

  read -p "Enter the domain name: " DOMAIN
  if [[ $DOMAIN != "" ]]; then
    sed -i "s/server_name _;/server_name $DOMAIN;/" $FILE
  else 
    echo "You intered nothing, please try again"
    exit 0;
  fi

else 
    echo "$FILE does not exist."
    exit 0;
fi

systemctl restart nginx


progress "Domain name has been added"