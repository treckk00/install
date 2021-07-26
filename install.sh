#!/bin/sh

sudo do-release-upgrade
sudo apt-get update

echo "Iniciando Instalacion del panel!"
bash <(curl -s https://raw.githubusercontent.com/vilhelmprytz/pterodactyl-installer/v0.7.0/install-panel.sh)
sleep 2
echo "Iniciando Instalacion de PhpMyAdmin"
bash <(curl -s https://raw.githubusercontent.com/Revenact/Pterodactyl-Script/v0.0.12/install.sh)
sleep 2
echo "Iniciando Instalacion de Wings"
bash <(curl -s https://raw.githubusercontent.com/vilhelmprytz/pterodactyl-installer/v0.7.0/install-wings.sh)
sleep 2


apt install ufw
ufw allow 22
ufw allow 80
ufw allow 8080
ufw allow 443
ufw allow 30120
ufw allow 40120
ufw allow 3306
ufw allow 2022
ufw enable

echo "* Create MySQL user."
mysql -u root -p '' "create user 'user'@'%' identified by 'Password1';"
mysql -u root -p '' "grant all privileges on *.* to 'user'@'%' with grant option;"
echo "* Flushing privileges.."
mysql -u root -p '' "FLUSH PRIVILEGES;"

echo "* Create MySQL user."
mysql -u root -p '' "create user 'server'@'%' identified by 'Password1';"
mysql -u root -p '' "CREATE DATABASE server;"
mysql -u root -p '' "grant all privileges on server.* to 'server'@'%';"

echo "* Flushing privileges.."
mysql -u root -p '' "FLUSH PRIVILEGES;"

echo "* MySQL database created & configured!"
exit

echo "* Se ha instalado todo correctamente!"