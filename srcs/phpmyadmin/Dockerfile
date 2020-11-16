#Image
FROM alpine:3.7

LABEL maintainer="aurbuche <aurbuche@student.42.fr>"

#Install packages
RUN			apt-get update && \
			apt-get -y upgrade && \
			apt-get -y install wget && \
			apt-get -y install php php-fpm php-mysql php-gd php-soap php-curl php-gd php-cli php-mbstring php-xml php-xmlrpc php-zip

EXPOSE 5000

#PHPMyAdmin setup
RUN			wget -q https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.xz

RUN			tar -xf phpMyAdmin-4.9.2-all-languages.tar.xz && \
	 		rm -rf phpMyAdmin-4.9.2-all-languages.tar.xz && \
			mv phpMyAdmin-4.9.2-all-languages ./phpmyadmin

RUN			echo "\033[38;2;0;128;0mPHPMyAdmin is installed\033[0m"

