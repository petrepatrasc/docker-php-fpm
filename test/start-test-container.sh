#!/usr/bin/env bash

sudo docker build -t petrepatrasc/docker-php-fpm-development . && \
sudo docker run -d \
  --name php_dev \
  -e PHP_CONF_MAX_EXECUTION_TIME=60 \
  -e PHP_CONF_XDEBUG_TRACE_ENABLE_TRIGGER=0 \
  petrepatrasc/docker-php-fpm-development;

sleep 5;
