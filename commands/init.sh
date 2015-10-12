#!/usr/bin/env bash

DIR=$(dirname "$0");

"$DIR/setup-fpm-conf.sh";
"$DIR/setup-cli-conf.sh";
"$DIR/setup-fpm-pool.sh";
