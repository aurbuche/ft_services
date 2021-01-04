FROM	alpine:latest

LABEL	maintainer="aurbuche <aurbuche@student.42lyon.fr>"

#Install packages
RUN		apk update
RUN		apk upgrade
RUN		apk add openrc --no-cache
RUN		apk add sudo vim git wget
RUN		apk add lighttpd php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN		mkdir /www

#Install and configure WordPress
RUN		wget http://wordpress.org/latest.tar.gz
RUN		tar -xzvf latest.tar.gz
RUN		rm latest.tar.gz
RUN		openrc
COPY	srcs/wp-config.php /www/wp-config.php


EXPOSE	5050