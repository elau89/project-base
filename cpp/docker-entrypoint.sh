#!/bin/bash

set -e

if [ -z $APP_UID ] || [ -z $APP_GID ]; then
    echo "Environment variables APP_UID and APP_GID must be set"
    exit 1
fi

groupadd -g $APP_GID dev_group
useradd -c 'Account passed through from host' \
    -r -u $APP_UID -g $APP_GID dev_user
chown -R dev_user:dev_group /app

exec "$@"
