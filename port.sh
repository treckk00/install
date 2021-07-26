#!/bin/sh

echo "* Puertos Configurados."
apt install ufw
process_id=$!

ufw allow 22
wait $process_id
ufw allow 80
wait $process_id
ufw allow 8080
wait $process_id
ufw allow 443
wait $process_id
ufw allow 30120
wait $process_id
ufw allow 40120
wait $process_id
ufw allow 3306
wait $process_id
ufw allow 2022
process_id=$!
wait $process_id
ufw enable