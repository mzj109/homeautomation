#!/usr/bin/env bash
cd ~/code
. ./shell/appenv
python3 -m web.controller >$LOGDIR/controller.log 2>&1 &
