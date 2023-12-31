#!/usr/bin/env bash
. ~/.profile
cd ~/ha
. ./shell/appenv
/home/pi/myPy39/bin/python3 -m celery -A tasks.celerytasks worker -Q local --loglevel=info
