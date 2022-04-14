#!/usr/bin/env bash

# platform tunnel:close -y

# platform tunnel:open
# export PLATFORM_RELATIONSHIPS="$(platform tunnel:info --encode)"

# Memcached
CACHE_HOST_MEMCACHED=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".memcachedcache[0].host")
CACHE_PORT_MEMCACHED=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".memcachedcache[0].port")
CACHE_LOCATION_MEMCACHED=$CACHE_HOST_MEMCACHED:$CACHE_PORT_MEMCACHED

# Redis
CACHE_SCHEME_REDIS=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".rediscache[0].scheme")
CACHE_USER_REDIS=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".rediscache[0].username")
CACHE_PW_REDIS=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".rediscache[0].password")
CACHE_HOST_REDIS=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".rediscache[0].host")
CACHE_PORT_REDIS=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".rediscache[0].port")


printf "# Generated Platform.sh local environment file.

## Databases.
# PostgreSQL.
DB_NAME_POSTGRES=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].path")
DB_HOST_POSTGRES=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].host")
DB_PORT_POSTGRES=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].port")
DB_USER_POSTGRES=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].username")
DB_PW_POSTGRES=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".database[0].password")
# MariaDB/MySQL.
DB_NAME_MYSQL=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".mysqldatabase[0].path")
DB_HOST_MYSQL=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".mysqldatabase[0].host")
DB_PORT_MYSQL=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".mysqldatabase[0].port")
DB_USER_MYSQL=$(echo $PLATFORM_RELATIONSHIPS | base64 --decode | jq -r ".mysqldatabase[0].username")

## Caching.
# Memcached.
CACHE_LOCATION_MEMCACHED=$CACHE_HOST_MEMCACHED:$CACHE_PORT_MEMCACHED
# Redis.
CACHE_LOCATION_REDIS=$CACHE_SCHEME_REDIS://$CACHE_HOST_REDIS:$CACHE_PORT_REDIS
" > .env

# poetry run python manage.py runserver
