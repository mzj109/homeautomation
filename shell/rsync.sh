#!/bin/bash
. /code/LOCATION_CONF
sleep 240
/bin/mount /mnt/netgear-usb
/usr/bin/rsync -vvv -H -r --ignore-times --remove-source-files $LOCAL_MEDIA $REMOTE_MEDIA
/bin/umount /mnt/netgear-usb
