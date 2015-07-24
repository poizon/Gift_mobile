#!/bin/sh
#plackup --server Starman --workers=5 -D --port 5000  --app /var/www/admin/admin.pl

SITENAME=Gift

DIR=/home/pavel/Gift_mobile/mobile/script
SCRIPT=mobile
#USER=root
WORKERS=3
LISTEN=*:3000
ERROR_LOG=/home/pavel/Gift_mobile/mobile/log/error_starman.log

PIDFILE=$DIR/site-$SITENAME.pid



case "$1" in
  start)
    plackup --server Starman --workers=$WORKERS -D --listen $LISTEN  \
    --app $DIR/$SCRIPT --pidfile=$PIDFILE \
    --pid $PIDFILE \
    --error-log $ERROR_LOG
    ;;
  stop)
    start-stop-daemon --stop --pidfile $PIDFILE
    ;;
  *)
    echo "Usage: $SCRIPTNAME {start|stop}" >&2
    exit 3
    ;;
esac
