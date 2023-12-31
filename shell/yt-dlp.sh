. ~/.profile
export SHELL=/bin/bash
export LANGUAGE=en_US.UTF-8
LANG=en_US.UTF-8
export VIRTUAL_ENV=/home/pi/myPy39
export LD_LIBRARY_PATH=/opt/Python3.9/lib:
export LC_ALL=en_US.UTF-8
export PATH=/opt/Python3.9/bin:/home/pi/.local/bin:/home/pi/myPy39/bin:/opt/Python3.9/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games:/usr/local/node-v14.17.3-linux-armv7l/bin
echo "attempting download of $1" >/tmp/yt.log
cd ~/Music; 
FLDR=${2-pop}
mkdir -p $FLDR
cd $FLDR
yt-dlp -q -x --no-mtime --audio-format mp3  --audio-quality 0 $1 >>/tmp/yt.log 2>&1
EXITCODE=$?
echo "Job ended with code $EXITCODE"
echo "Job ended with code $EXITCODE" >>/tmp/yt.log 2>&1
