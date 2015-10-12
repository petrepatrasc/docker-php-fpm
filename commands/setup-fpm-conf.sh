#!/usr/bin/env bash

sed -i "s|;max_execution_time.*|max_execution_time = ${PHP_CONF_MAX_EXECUTION_TIME}|" ${PHP_CONF_FILE};

sed -i "s|;upload_max_filesize.*|upload_max_filesize = ${PHP_CONF_UPLOAD_LIMIT}|" ${PHP_CONF_FILE};
sed -i "s|;post_max_size.*|post_max_size = ${PHP_CONF_UPLOAD_LIMIT}|" ${PHP_CONF_FILE};

sed -i "s|;date.timezone.*|date.timezone = ${PHP_CONF_TIMEZONE}|" ${PHP_CONF_FILE};
sed -i "s|;phar.readonly.*|phar.readonly = ${PHP_CONF_PHAR_READONLY}|" ${PHP_CONF_FILE};
sed -i "s|;memory_limit.*|memory_limit = ${PHP_CONF_MEMORY_LIMIT}|" ${PHP_CONF_FILE};
sed -i "s|;display_errors.*|display_errors = ${PHP_CONF_DISPLAY_ERRORS}|" ${PHP_CONF_FILE};
sed -i "s|;error_reporting.*|error_reporting = ${PHP_CONF_ERROR_REPORTING}|" ${PHP_CONF_FILE};

sed -i "s|;xdebug.max_nesting_level.*|xdebug.max_nesting_level = ${PHP_CONF_XDEBUG_MAX_NESTING_LEVEL}|" ${PHP_CONF_FILE};
sed -i "s|;xdebug.remote_enable.*|xdebug.remote_enable = ${PHP_CONF_XDEBUG_REMOTE_ENABLE}|" ${PHP_CONF_FILE};
sed -i "s|;xdebug.remote_hander.*|xdebug.remote_hander = ${PHP_CONF_XDEBUG_REMOTE_HANDLER}|" ${PHP_CONF_FILE};
sed -i "s|;xdebug.remote_connect_back.*|xdebug.remote_connect_back = ${PHP_CONF_XDEBUG_REMOTE_CONNECT_BACK}|" ${PHP_CONF_FILE};
sed -i "s|;xdebug.remote_port.*|xdebug.remote_port = ${PHP_CONF_XDEBUG_REMOTE_PORT}|" ${PHP_CONF_FILE};
sed -i "s|;xdebug.idekey.*|xdebug.idekey = ${PHP_CONF_XDEBUG_IDEKEY}|" ${PHP_CONF_FILE};

sed -i "s|;xdebug.profiler_enable_trigger.*|xdebug.profiler_enable_trigger = ${PHP_CONF_XDEBUG_PROFILER_ENABLE_TRIGGER}|" ${PHP_CONF_FILE};
sed -i "s|;xdebug.profiler_output_dir.*|xdebug.profiler_output_dir = \"${PHP_CONF_XDEBUG_PROFILER_OUTPUT_DIR}\"|" ${PHP_CONF_FILE};
sed -i "s|;xdebug.profiler_output_name.*|xdebug.profiler_output_name = \"${PHP_CONF_XDEBUG_PROFILER_OUTPUT_NAME}\"|" ${PHP_CONF_FILE};

sed -i "s|;xdebug.trace_enable_trigger.*|xdebug.trace_enable_trigger = ${PHP_CONF_XDEBUG_TRACE_ENABLE_TRIGGER}|" ${PHP_CONF_FILE};
sed -i "s|;xdebug.trace_output_dir.*|xdebug.trace_output_dir = \"${PHP_CONF_XDEBUG_TRACE_OUTPUT_DIR}\"|" ${PHP_CONF_FILE};
sed -i "s|;xdebug.trace_output_name.*|xdebug.trace_output_name = \"${PHP_CONF_XDEBUG_TRACE_OUTPUT_NAME}\"|" ${PHP_CONF_FILE};
