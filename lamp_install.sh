#!/bin/sh

RED='\033[0;31m'
GREEN='\033[1;32m'
RESET='\033[0m'

if  [ $(id -u) != 0 ]; then
    clear
    echo "${RED}Error: You must be root to execute the script !${RESET}"
    exit
fi

clear

echo "${GREEN}[LAMP]${RESET} Apache2 MariaDB & PHP will be installed in a few seconds"

sleep 3

clear

echo "${GREEN} -- Apache2 ${RESET}"
apt install apache2 -y

clear

echo "${GREEN} -- MariaDB Server${RESET}"
apt install mariadb-server -y

clear

echo "${GREEN} -- Starting Mysql Secure Install${RESET}"
mysql_secure_installation

clear

echo "${GREEB} -- PHP and Libs"
apt install php libapache2-mod-php php-gd php-mysql
rm /var/www/html/index.html
wget https://f2ville.space/lamp/index.html > /var/www/html/index.html

echo "${GREEN}[LAMP]${RESET} Website on /var/www/html"
