#Image
FROM alpine:latest

LABEL maintainer="aurbuche <aurbuche@student.42.fr>"

#Install packages
RUN		apk update
RUN		apk upgrade
RUN		apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

#PHPMyAdmin setup
RUN			wget -q https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.xz

RUN		tar -xf phpMyAdmin-4.9.2-all-languages.tar.xz && \
		rm -rf phpMyAdmin-4.9.2-all-languages.tar.xz && \
		mv phpMyAdmin-4.9.2-all-languages /www

RUN		apk add openrc
RUN		openrc
RUN		touch /run/openrc/softlevel

EXPOSE		5000

RUN			echo "\033[38;2;0;128;0mPHPMyAdmin is installed\033[0m"

