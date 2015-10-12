#!/usr/bin/env bash

DIR=$(dirname "$0");

"$DIR/setup-fpm-conf.sh";
"$DIR/setup-cli-conf.sh";
"$DIR/setup-fpm-pool.sh";

touch /var/log/php5-fpm.log;
exec supervisord -n -c /etc/supervisor/supervisord.conf;
