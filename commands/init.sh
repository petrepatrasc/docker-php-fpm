#!/usr/bin/env bash

DIR=$(dirname "$0");

if [[ ${PHP_IGNORE_ENVIRONMENT_SETTINGS} != "true" ]]; then
  "$DIR/setup-fpm-conf.sh";
  "$DIR/setup-cli-conf.sh";
  "$DIR/setup-fpm-pool.sh";
fi

touch /var/log/php7-fpm.log;
exec supervisord -n -c /etc/supervisor/supervisord.conf;
