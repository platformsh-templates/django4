#!/usr/bin/env bash

platform tunnel:close -y

platform tunnel:open
export PLATFORM_RELATIONSHIPS="$(platform tunnel:info --encode)"

printf "# Generated Platform.sh local environment file. 
DATABASE_NAME=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].path")
DATABASE_HOST=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].host")
DATABASE_PORT=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].port")
DATABASE_USER=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].username")
DATABASE_PASSWORD=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].password")
" > .env

poetry run python manage.py runserver
