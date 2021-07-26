#!/bin/sh

echo "* Puertos Configurados."
apt install ufw
sleep 2
ufw allow 22
sleep 2
ufw allow 80
sleep 2
ufw allow 8080
sleep 2
ufw allow 443
sleep 2
ufw allow 30120
sleep 2
ufw allow 40120
sleep 2
ufw allow 3306
sleep 2
ufw allow 2022
sleep 2
ufw enable