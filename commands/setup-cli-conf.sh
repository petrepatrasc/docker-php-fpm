#!/usr/bin/env bash

sed -i "s|;date.timezone.*|date.timezone = ${PHP_CONF_TIMEZONE}|" ${PHP_CONF_FILE_CLI};
sed -i "s|;phar.readonly.*|phar.readonly = ${PHP_CONF_PHAR_READONLY}|" ${PHP_CONF_FILE_CLI};
sed -i "s|;memory_limit.*|memory_limit = ${PHP_CONF_MEMORY_LIMIT}|" ${PHP_CONF_FILE_CLI};
sed -i "s|;display_errors.*|display_errors = ${PHP_CONF_DISPLAY_ERRORS}|" ${PHP_CONF_FILE_CLI};
sed -i "s|;error_reporting.*|error_reporting = ${PHP_CONF_ERROR_REPORTING}|" ${PHP_CONF_FILE_CLI};
