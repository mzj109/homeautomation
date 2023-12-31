#!/usr/bin/env bash
#exit 0
cd ~/code
. ./shell/appenv
sleep 60
systemctl stop dlurl
sudo init 0
