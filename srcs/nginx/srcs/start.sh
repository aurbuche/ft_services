#!/bin/bash

service mysql restart 2> /dev/null
service php7.3-fpm start
nginx -g 'daemon off;'