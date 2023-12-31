# if its before 0830 hrs, broadcast weather and play music, on boot.
set -xv
. ./shell/appenv

tail -f logs/celery.log logs/controller.log
