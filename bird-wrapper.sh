#!/bin/sh

set -e

ETH0_ADDR=`ip -4 -o a | awk '/eth0/ { split($4, a, "/"); print a[1] }'`

# Update bird.conf
sed -i "s/BIRD_ROUTERID/${ETH0_ADDR}/g" /etc/bird.conf

# Start bird
bird

# Execute provided command
while true; do
    $@
done
