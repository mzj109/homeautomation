#!/bin/bash
echo "$(date): Sleeping for 60, secs then checking network..."
sleep 60
ifconfig eth0 |grep "192\.168"
if [[ $? -eq 0 ]]; then
 echo "$(date): Found network, exit.."
else 
 echo "$(date): No network found. Restarting.."
 init 6
fi
echo -e "Done\n"
