FROM ubuntu:15.04
MAINTAINER Petre Pătrașc <petre@dreamlabs.ro>
ENV REFRESHED_AT 2015-10-12 21:41:00

# Noninteractive installs
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    locale-gen en_US.UTF-8

# System environment setup
ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 \
    HOME=/root \
    DEBIAN_FRONTEND=noninteractive

# Require packages
RUN apt-get update -y -qq &&  \
    apt-get upgrade -y -qq && \
    apt-get install -qq -y \
        vim \
        curl \
        software-properties-common

# Conf settings
ENV PHP_CONF_FILE=/etc/php5/fpm/conf.d/99-system.ini \
    PHP_CONF_FILE_CLI=/etc/php5/cli/conf.d/99-system.ini \
    PHP_CONF_TIMEZONE=Europe/London \
    PHP_CONF_MAX_EXECUTION_TIME=30 \
    PHP_CONF_UPLOAD_LIMIT=40M \
    PHP_CONF_PHAR_READONLY=off \
    PHP_CONF_MEMORY_LIMIT=512M \
    PHP_CONF_DISPLAY_ERRORS=on \
    PHP_CONF_ERROR_REPORTING=E_ALL \
    PHP_CONF_XDEBUG_MAX_NESTING_LEVEL=350 \
    PHP_CONF_XDEBUG_REMOTE_ENABLE=on \
    PHP_CONF_XDEBUG_REMOTE_HANDLER=dbgp \
    PHP_CONF_XDEBUG_REMOTE_CONNECT_BACK=on \
    PHP_CONF_XDEBUG_REMOTE_PORT=9005 \
    PHP_CONF_XDEBUG_IDEKEY=xdebug \
    PHP_CONF_XDEBUG_PROFILER_ENABLE_TRIGGER=1 \
    PHP_CONF_XDEBUG_PROFILER_OUTPUT_DIR=/var/xdebug/profile/ \
    PHP_CONF_XDEBUG_PROFILER_OUTPUT_NAME=profile.out.%t \
    PHP_CONF_XDEBUG_TRACE_ENABLE_TRIGGER=1 \
    PHP_CONF_XDEBUG_TRACE_OUTPUT_DIR=/var/xdebug/trace/ \
    PHP_CONF_XDEBUG_TRACE_OUTPUT_NAME=trace.out.%t

# Pool settings
ENV PHP_POOL_FILE=/etc/php5/fpm/pool.d/99-system.pool.conf \
    PHP_POOL_USER=root \
    PHP_POOL_GROUP=root \
    PHP_POOL_LISTEN_HOST=127.0.0.1 \
    PHP_POOL_LISTEN_PORT=9000 \
    PHP_POOL_PM_CONTROL=dynamic \
    PHP_POOL_PM_MAX_CHILDREN=20 \
    PHP_POOL_PM_START_SERVERS=2 \
    PHP_POOL_PM_MIN_SPARE_SERVERS=1 \
    PHP_POOL_PM_MAX_SPARE_SERVERS=3 \
    PHP_POOL_CATCH_WORKERS_OUTPUT=yes

# Install PHP
RUN add-apt-repository ppa:ondrej/php5-5.6 && \
    apt-get update -qq &&     \
    apt-get install -qq -y    \
    		php5-fpm              \
    		php5-curl             \
    		php5-cli              \
    		php5-json             \
    		php5-intl             \
    		php5-imap             \
    		php5-mcrypt           \
    		php5-xdebug           \
    		php5-memcached        \
    		php5-mysql            \
        php5-ldap

# Add PHP5-FPM Configuration Files
ADD php5-fpm /etc/php5/

# Make sure to run PHP as not daemonized
RUN sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php5/fpm/php-fpm.conf && \
		rm -f /etc/php5/fpm/pool.d/www.conf

ADD commands /root/commands
WORKDIR /etc/php5
EXPOSE $PHP_POOL_LISTEN_PORT
CMD ["/root/commands/init.sh"]
