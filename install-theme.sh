#!/bin/sh

cd /var/www/pterodactyl
sleep 2

echo "Downloading the Theme"
mkdir -p tempdown && cd tempdown && git clone https://github.com/treckk00/pageDesign.git .
cp -r app ..
cp -r config ..
cp -r database ..
cp -r public ..
cp -r resources ..
cp -r routes ..

echo "Files have been copied over!"
sleep 2

echo "Removing the temp folders created in the copy process"

cd .. && rm -rf tempdown
sleep 2
php artisan migrate --path=/database/migrations/2021_05_30_141248_create_unix_settings_table.php
sleep 2

echo "Complete! Have a good day"