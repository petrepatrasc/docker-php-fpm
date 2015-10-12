#!/usr/bin/env bash

PHP_VERSION_INSTALLED=$(docker exec php_dev php --version | grep "PHP 5.6")
if [ -z "$PHP_VERSION_INSTALLED" ]; then
  exit 1
fi

$(docker exec php_dev nc -z localhost 9000)
PHP_PORT_IS_OPEN=$?
if [ "$PHP_PORT_IS_OPEN" -eq 1 ]; then
  exit 1
fi

MAX_EXECUTION_TIME_IS_OVERWRITTEN=$(docker exec php_dev cat /etc/php5/fpm/conf.d/99-system.ini | grep "max_execution_time = 60")
if [ -z "$MAX_EXECUTION_TIME_IS_OVERWRITTEN" ]; then
  exit 1
fi

XDEBUG_TRACE_IS_OVERWRITTEN=$(docker exec php_dev cat /etc/php5/fpm/conf.d/99-system.ini | grep "xdebug.trace_enable_trigger = 0")
if [ -z "$XDEBUG_TRACE_IS_OVERWRITTEN" ]; then
  exit 1
fi

exit 0
