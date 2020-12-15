#Image
FROM	alpine:latest

LABEL	maintainer="aurbuche <aurbuche@student.42.fr>"

#Install packages
RUN		apk update
RUN		apk upgrade
RUN		apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session

RUN		apk add openrc
RUN		openrc
RUN		touch /run/openrc/softlevel

#PHPMyAdmin setup
RUN		mkdir -p /usr/share/webapps/
RUN		cd /usr/share/webapps
RUN		wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz
RUN		tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz
RUN		rm phpMyAdmin-5.0.2-all-languages.tar.gz
RUN		mv phpMyAdmin-5.0.2-all-languages phpmyadmin
RUN		chmod -R 777 /usr/share/webapps

EXPOSE	5000
