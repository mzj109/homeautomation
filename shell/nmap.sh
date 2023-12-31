. ~/code/shell/appenv
REPORT=$LOGDIR/nmap.xml
HTML=~/code/static_files/nmap.html
sudo nmap  -sn 192.168.1.0/24 -oX $REPORT
xsltproc $REPORT -o $HTML


#for ip in $(cat ../logs/nmap.log|grep "report " |cut -d" " -f5)
#  do
#  #sudo nmap $ip -O >> $REPORT
#  echo 1
#  done



