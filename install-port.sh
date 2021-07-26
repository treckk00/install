#!/bin/sh
echo "* Puertos Configurados."
apt install ufw &
process_id=$!
wait $process_id &
ufw allow 22 &
ufw allow 80 &
ufw allow 8080 &
ufw allow 443 &
ufw allow 30120 &
ufw allow 40120 &
ufw allow 3306 &
ufw allow 2022 &
process_id2=$!
wait $process_id2
ufw enable