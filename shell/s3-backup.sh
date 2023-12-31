. ~/.profile
export SHELL=/bin/bash
export LANGUAGE=en_US.UTF-8
LANG=en_US.UTF-8
export VIRTUAL_ENV=/home/pi/myPy39
export LD_LIBRARY_PATH=/opt/Python3.9/lib:
export LC_ALL=en_US.UTF-8
export PATH=/opt/Python3.9/bin:/home/pi/.local/bin:/home/pi/myPy39/bin:/opt/Python3.9/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games:/usr/local/node-v14.17.3-linux-armv7l/bin
echo "backup music starting: `date`"
cd ~
aws s3 sync ./Music s3://prod-archive-jhala/music/
echo "backup code: `date`"
cd ~/code
CODE_FILE_NAME=homeautomation-master.controller.pi4.`date +%Y%m%d`.tgz
tar -cz ./homeautomation-master | aws s3 cp - s3://prod-archive-jhala/code/$CODE_FILE_NAME

echo "backup books starting: `date`"
cd /mnt/usb-disk/multimedia/
aws s3 sync ./books s3://prod-archive-jhala/books/

echo "backup movies starting: `date`"
cd /mnt/usb-disk/multimedia/
aws s3 sync ./movies s3://prod-archive-jhala/movies/

echo "end `date`"


