#!/bin/sh
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