# Docker PHP-FPM

[![Build Status](https://travis-ci.org/petrepatrasc/docker-php-fpm.svg?branch=master)](https://travis-ci.org/petrepatrasc/docker-php-fpm)

This repository is a customisable PHP-FPM container intended to be used to run stable code. It is not intended for development - if you require Xdebug and other development configurations, instead use [https://hub.docker.com/r/petrepatrasc/docker-php-fpm-development/](https://hub.docker.com/r/petrepatrasc/docker-php-fpm-development/).

The PHP version included on this branch is `7.0`. If you want to use `5.6` instead, please see the [5.6 branch](https://github.com/petrepatrasc/docker-php-fpm/).

Note that both versions have Composer bundled into the container.

* [Docker Hub](https://hub.docker.com/r/petrepatrasc/docker-php-fpm/)
* [GitHub](https://github.com/petrepatrasc/docker-php-fpm)

## Usage

In order to test the container you can simply run:

`docker run --rm --name php -p 9000:9000 petrepatrasc/docker-php-fpm:7.0`

The command above will start the php-fpm process within Supervisor, keeping it alive until the container is stopped, with FPM's pool listening for connections on port 9000. Please note that you will still require a webserver to act as a proxy for the requests.
You can also connect to the container to run interactive code via `php -a`:

`docker exec -it php bash`

## Versions

The image is available on Docker Hub for multiple versions of PHP-FPM:

* 5.6: `docker run --rm --name php petrepatrasc/docker-php-fpm:5.6`
* 7.0: `docker run --rm --name php petrepatrasc/docker-php-fpm:7.0`

## Building

If you are building this container from source you want to run:

`docker build -t petrepatrasc/docker-php-fpm .`

You may then run and configure the container using the instructions in this README.

## Extending

You may want to extend the container in order to include some additional packages on the container, or additional PHP extension. For instance, in order to add the Mongo extension, simply create a Dockerfile and extend the container.

    FROM petrepatrasc/docker-php-fpm:7.0

    RUN apt-get install -y php7.0-mongo

Then run: `docker build -t yourname/docker-php-fpm .`. You may then replace `petrepatrasc` with `yourname` in the examples in this README and you will be referencing the container that you've build which also has the Mongo extension.

## Configuration

This container comes with two basic methods of customising the configuration - either via environment variables or via configuration scripts.

### Environment Variables

Below you can find an example of overwriting the configuration via the `docker run` command and also via docker compose. You do not need to provide all of the values below - simply change the ones that you are interested in (error reporting, memory limit, max execution times, etc.).

    docker run -d --name php \
      -e PHP_CONF_FILE=/etc/php/7.0/fpm/conf.d/20-system.ini \
      -e PHP_CONF_FILE_CLI=/etc/php/7.0/cli/conf.d/20-system.ini \
      -e PHP_CONF_TIMEZONE=UTC \
      -e PHP_CONF_MAX_EXECUTION_TIME=30 \
      -e PHP_CONF_UPLOAD_LIMIT=40M \
      -e PHP_CONF_PHAR_READONLY=off \
      -e PHP_CONF_MEMORY_LIMIT=512M \
      -e PHP_CONF_DISPLAY_ERRORS=off \
      -e PHP_CONF_ERROR_REPORTING=0 \
      -e PHP_POOL_FILE=/etc/php/7.0/fpm/pool.d/20-system.pool.conf \
      -e PHP_POOL_USER=www-data \
      -e PHP_POOL_GROUP=www-data \
      -e PHP_POOL_LISTEN_HOST=127.0.0.1 \
      -e PHP_POOL_PM_CONTROL=dynamic \
      -e PHP_POOL_PM_MAX_CHILDREN=20 \
      -e PHP_POOL_PM_START_SERVERS=2 \
      -e PHP_POOL_PM_MIN_SPARE_SERVERS=1 \
      -e PHP_POOL_PM_MAX_SPARE_SERVERS=3 \
      -e PHP_POOL_CATCH_WORKERS_OUTPUT=yes \
      petrepatrasc/docker-php-fpm:7.0;

Alternatively, using docker compose, you can define the following configuration:

    fpm:
      image: petrepatrasc/docker-php-fpm:7.0
      ports:
        - "9000"
      environment:
        - PHP_CONF_FILE=/etc/php/7.0/fpm/conf.d/20-system.ini
        - PHP_CONF_FILE_CLI=/etc/php/7.0/cli/conf.d/20-system.ini
        - PHP_CONF_TIMEZONE=Europe/Bucharest
        - PHP_CONF_MAX_EXECUTION_TIME=30
        - PHP_CONF_UPLOAD_LIMIT=40M
        - PHP_CONF_PHAR_READONLY=off
        - PHP_CONF_MEMORY_LIMIT=512M
        - PHP_CONF_DISPLAY_ERRORS=off
        - PHP_CONF_ERROR_REPORTING=0
        - PHP_POOL_FILE=/etc/php/7.0/fpm/pool.d/20-system.pool.conf
        - PHP_POOL_USER=www-data
        - PHP_POOL_GROUP=www-data
        - PHP_POOL_LISTEN_HOST=127.0.0.1
        - PHP_POOL_PM_CONTROL=dynamic
        - PHP_POOL_PM_MAX_CHILDREN=20
        - PHP_POOL_PM_START_SERVERS=2
        - PHP_POOL_PM_MIN_SPARE_SERVERS=1
        - PHP_POOL_PM_MAX_SPARE_SERVERS=3
        - PHP_POOL_CATCH_WORKERS_OUTPUT=yes

### Configuration Script

In the event that you do not want to use environment variables method of configuration, or if you need to set configuration parameters for some other directives, simply overwrite the container within your own image and `ADD` over the following configuration files:

* /etc/php/7.0/cli/conf.d/20-system.ini
* /etc/php/7.0/fpm/conf.d/20-system.ini
* /etc/php/7.0/fpm/pool.d/20-system.pool.conf

## Contributing

Let me know if you need help with anything via the issues section on the repository, or just email me if I can help out. If you see an improvement of any kind, just drop a pull request.
