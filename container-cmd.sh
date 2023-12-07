#!/bin/bash

PROJECT_NAME=ssl-sample

if [ "$1" = 'up' ]; then
  docker compose -f ./docker-compose.yml --project-name $PROJECT_NAME up -d
fi

if [ "$1" = 'down' ]; then
  docker compose -f ./docker-compose.yml --project-name $PROJECT_NAME down
fi
