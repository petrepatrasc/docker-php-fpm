#!/usr/bin/env bash

sed -i "s|;max_execution_time.*|max_execution_time = ${PHP_CONF_MAX_EXECUTION_TIME}|" ${PHP_CONF_FILE};

sed -i "s|;upload_max_filesize.*|upload_max_filesize = ${PHP_CONF_UPLOAD_LIMIT}|" ${PHP_CONF_FILE};
sed -i "s|;post_max_size.*|post_max_size = ${PHP_CONF_UPLOAD_LIMIT}|" ${PHP_CONF_FILE};

sed -i "s|;date.timezone.*|date.timezone = ${PHP_CONF_TIMEZONE}|" ${PHP_CONF_FILE};
sed -i "s|;phar.readonly.*|phar.readonly = ${PHP_CONF_PHAR_READONLY}|" ${PHP_CONF_FILE};
sed -i "s|;memory_limit.*|memory_limit = ${PHP_CONF_MEMORY_LIMIT}|" ${PHP_CONF_FILE};
sed -i "s|;display_errors.*|display_errors = ${PHP_CONF_DISPLAY_ERRORS}|" ${PHP_CONF_FILE};
sed -i "s|;error_reporting.*|error_reporting = ${PHP_CONF_ERROR_REPORTING}|" ${PHP_CONF_FILE};
