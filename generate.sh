#!/usr/bin/env bash

cleanup () {
    platform tunnel:close -y
    unset PLATFORM_RELATIONSHIPS
}

cleanup

PROJECT_NAME=platformsh-django4
APP_NAME=app

mkdir $PROJECT_NAME
cd $PROJECT_NAME

# Create the project.
poetry init --name=$PROJECT_NAME -n -q
# Django and environment variables.
poetry add -q Django django-environ
# Server options.
# https://docs.djangoproject.com/en/4.0/howto/deployment/asgi/daphne/
# https://docs.djangoproject.com/en/4.0/howto/deployment/asgi/hypercorn/
# https://docs.djangoproject.com/en/4.0/howto/deployment/asgi/uvicorn/
poetry add -q uvicorn gunicorn daphne hypercorn
# Database options.
poetry add -q psycopg2 pymysql
# Caching options. 
poetry add -q pymemcache redis
# Extras.
poetry add -q blackfire

poetry version
poetry show

poetry run django-admin.py startproject $APP_NAME .
poetry run python manage.py migrate

poetry run python manage.py startapp pages

rsync -aP ../files/ .

poetry run python manage.py collectstatic

# ./run_local.sh
