set -xv
P=$(ps aux|grep web.controller |grep -v grep| awk '{print $2}')
kill -9 $P
