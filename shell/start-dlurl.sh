#!/usr/bin/env bash
cd ~/code
. ./shell/appenv
redis-server >$LOGDIR/redis.log 2>&1 &
python3 -m celery -A tasks.celerytasks worker --loglevel=info >$LOGDIR/celery.log 2>&1 &
python3 -m web.controller >$LOGDIR/controller.log 2>&1 &
