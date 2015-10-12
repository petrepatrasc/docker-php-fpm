#!/usr/bin/env bash

sed -i "s|;user.*|user = ${PHP_POOL_USER}|" ${PHP_POOL_FILE};
sed -i "s|;group.*|group = ${PHP_POOL_GROUP}|" ${PHP_POOL_FILE};

sed -i "s|;listen.*|listen = ${PHP_POOL_LISTEN_HOST}:${PHP_POOL_LISTEN_PORT}|" ${PHP_POOL_FILE};

sed -i "s|;pm.max_children.*|pm.max_children = ${PHP_POOL_PM_MAX_CHILDREN}|" ${PHP_POOL_FILE};
sed -i "s|;pm.start_servers.*|pm.start_servers = ${PHP_POOL_PM_START_SERVERS}|" ${PHP_POOL_FILE};
sed -i "s|;pm.min_spare_servers.*|pm.min_spare_servers = ${PHP_POOL_PM_MIN_SPARE_SERVERS}|" ${PHP_POOL_FILE};
sed -i "s|;pm.max_spare_servers.*|pm.max_spare_servers = ${PHP_POOL_PM_MAX_SPARE_SERVERS}|" ${PHP_POOL_FILE};
sed -i "s|;pm|pm = ${PHP_POOL_PM_CONTROL}|" ${PHP_POOL_FILE};

sed -i "s|;catch_workers_output.*|catch_workers_output = ${PHP_POOL_CATCH_WORKERS_OUTPUT}|" ${PHP_POOL_FILE};
