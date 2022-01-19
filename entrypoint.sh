#!/bin/bash

echo "Hi! student"

if [[ $# -eq 0 ]]; then
  exit 0
fi
prm=$1
case $prm in
run_ws)
  echo "WebServer will be run!"
  #exec "$@"
  exec /usr/sbin/nginx -g "daemon off;"
  ;;
*)
  echo "something else!"
  exec "$@"
  ;;
esac

