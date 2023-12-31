#!/usr/bin/env bash
. ~/.profile
#. ./shell/appenv
#cd $APP_HOME
/usr/local/bin/redis-server /etc/redis/6379.conf
#python3 -m celery -A tasks.celerytasks worker --loglevel=info >$LOGDIR/celery.log 2>&1 &
#python -m web.controller >$LOGDIR/controller.log 2>&1 &
