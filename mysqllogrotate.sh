#!/bin/bash

if [[ -e docker/db/log/slow.log ]]; then
  mv docker/db/log/slow.log docker/db/log/slow.log`date +%Y%m%d-%H%M%S`
fi

echo -n "" > docker/db/log/slow.log

docker-compose exec db mysqladmin -u root -proot flush-logs
