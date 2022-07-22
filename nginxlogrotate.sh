#!/bin/bash

if [[ -e docker/app/nginx/access.log ]]; then
  mv docker/app/nginx/access.log docker/app/nginx/access.log.`date +%Y%m%d-%H%M%S`
fi

cat docker/app/nginx/server1/log/access.log > docker/app/nginx/access.log
echo "" >> docker/app/nginx/access.log
cat docker/app/nginx/server2/log/access.log >> docker/app/nginx/access.log

echo -n "" > docker/app/nginx/server1/log/access.log
echo -n "" > docker/app/nginx/server2/log/access.log

docker-compose exec server1 nginx -s reopen
docker-compose exec server2 nginx -s reopen