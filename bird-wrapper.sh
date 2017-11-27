#!/bin/sh

set -e

ROUTER_ID=`ip -4 -o a | awk '/eth0/ { split($4, a, "/"); print a[1] }'`
if [ -z "$ROUTER_ID" ]; then
    ROUTER_ID='127.0.0.1'
fi

# Update bird.conf
sed -i "s/BIRD_ROUTERID/${ROUTER_ID}/g" /etc/bird.conf

# Start bird
bird

# Execute provided command
while true; do
    $@
done
