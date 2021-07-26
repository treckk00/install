#!/bin/sh
if [ ! -f "artisan" ]; then
    echo "Could not find the Artisan file, Moving to Default Location."
    cd /var/www/pterodactyl
fi

if [ ! -f "artisan" ]; then
    echo "We tried to find your Artisan file but we couldnt, Please move to the directory you installed the Panel and re-run this script. Have a Good Day!"
    cd /var/www/pterodactyl
else

    echo "Your Artisan File has been found!"

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
    php artisan migrate --path=/database/migrations/2021_05_30_141248_create_unix_settings_table.php

    echo "Complete! Have a good day and dont forget to refresh your browser cache! (CTRL + F5)"
    echo "-Will"
fi