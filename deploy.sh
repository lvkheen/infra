#!/bin/bash

cd /opt/infra || exit 1
git pull

case "$1" in
  nginx)
    docker-compose restart nginx
    ;;
  redis)
    docker-compose restart redis
    ;;
  db)
    docker-compose restart db
    ;;
  all)
    docker-compose up -d
    ;;
  *)
    echo "Unknown service: $1"
    exit 1
    ;;
esac
