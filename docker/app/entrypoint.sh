#!/bin/bash

redis-server &

/usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf