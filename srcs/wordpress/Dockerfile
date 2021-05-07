FROM alpine:3.12

LABEL	maintainer="aurbuche <aurbuche@student.42lyon.fr>"

RUN		apk update --no-cache
RUN		apk upgrade --no-cache
RUN		apk add wget
RUN		apk add nginx
RUN		apk add openrc
RUN		apk add php-fpm
RUN		apk add php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN		adduser -D -g 'www' www
RUN		mkdir -p /www
RUN		chown -R www:www /www
RUN		mkdir -p /usr/share/webapps/
COPY	./srcs/wordpress /usr/share/webapps/

COPY	./srcs/nginx.conf /etc/nginx/nginx.conf
COPY	./srcs/wp-config.php /usr/share/webapps/wordpress/wp-config.php

RUN		openrc
RUN		touch /run/openrc/softlevel

RUN		wget https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3-static_linux_amd64.tar.gz
RUN		tar -xvf telegraf-1.13.3-static_linux_amd64.tar.gz
COPY	./srcs/telegraf.conf etc/telegraf/telegraf.conf

CMD		./telegraf/telegraf & php-fpm7; nginx -g 'pid /tmp/nginx.pid; daemon off;'

EXPOSE 5050