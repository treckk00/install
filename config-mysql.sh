#!/bin/sh

echo "* Create MySQL user."
mysql -u root -p '' "create user 'user'@'%' identified by 'Password1';"
sleep 2
mysql -u root -p '' "grant all privileges on *.* to 'user'@'%' with grant option;"
sleep 2
echo "* Flushing privileges.."
sleep 2
mysql -u root -p '' "FLUSH PRIVILEGES;"
sleep 2

echo "* Create MySQL user."
sleep 2
mysql -u root -p '' "create user 'server'@'%' identified by 'Password1';"
sleep 2
mysql -u root -p '' "CREATE DATABASE server;"
sleep 2
mysql -u root -p '' "grant all privileges on server.* to 'server'@'%';"
sleep 2

echo "* Flushing privileges.."
sleep 2
mysql -u root -p '' "FLUSH PRIVILEGES;"
sleep 2

echo "* MySQL database created & configured!"
exit

echo "* Se ha instalado todo correctamente!"