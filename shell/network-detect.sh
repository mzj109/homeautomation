#!/bin/bash
RET=1
set -xv
/sbin/ifconfig eth0 |grep "192\.168"
if [[ $? -eq 0 ]]; then
     while (( $RET > 0 )); do
       sudo ping -c4 www.google.com
       RET=$?
       echo "Checked internet availability"
       (( $RET > 0 )) && sleep 5
     done
fi
exit $RET
