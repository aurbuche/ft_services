#Image
FROM alpine:3.7

LABEL maintainer="aurbuche <aurbuche@student.42.fr>"

#Install packages
RUN		apk update
RUN		apk upgrade
RUN		apk

#PHPMyAdmin setup
RUN			wget -q https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.xz

RUN			tar -xf phpMyAdmin-4.9.2-all-languages.tar.xz && \
	 		rm -rf phpMyAdmin-4.9.2-all-languages.tar.xz && \
			mv phpMyAdmin-4.9.2-all-languages ./phpmyadmin

RUN			echo "\033[38;2;0;128;0mPHPMyAdmin is installed\033[0m"

