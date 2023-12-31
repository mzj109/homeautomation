#!/usr/bin/env bash
. ~/.profile
. ~/code/homeautomation/shell/appenv
cd $APP_HOME
export PATH=/home/pi/myPy39/bin:$PATH
#python3 -m web.controller &
python3 -m web.controller
