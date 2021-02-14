#!/bin/sh
if [ -z "$DOMAIN_SERVER" ]; then
  sed -i 's/obs.ninja/$DOMAIN_SERVER/g' /etc/nginx/nginx.conf
fi

nginx
