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

echo "Complete! Have a good day"