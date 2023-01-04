#! /bin/bash

CYAN='\033[1;36m'
NC='\033[0m'

title() {
  echo -e "\\n${CYAN}⬢ ${1}${NC}"
  echo -e "${CYAN}==============================${NC}"
}

progress() {
  echo -e "\\n${CYAN}⬢ ${1}${NC}"
}




# 01.init ---------------------

title "Updating OS"

apt update && apt upgrade -y

progress "OS has been updated"




# 02.tools ---------------------

tools=(
  nginx
  curl
  snapd
  sed
)

title "Installing necessary tools..."

for pkg in "${tools[@]}"; do
  pkg_name=$(echo "$pkg" | awk '{print $1}')
  progress "Installing $pkg_name"
  apt install "$pkg" -y > /dev/null
done




# 03.nginx ---------------------

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




# 04.snap ---------------------

title "Installing Snap core"

snap install core

progress "Snap core has been installed"




# 05.certbot ---------------------

title "Installing certbot"

snap install --classic certbot
ln -s /snap/bin/certbot /usr/bin/certbot
certbot certonly --nginx
certbot renew --dry-run

progress "Certificate has been installed"




# 06.xray ---------------------

title "Installing Xray"

bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install -u root

progress "Xray has been installed"




progress "All Done!"