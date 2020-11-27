#Image
FROM alpine:linux

LABEL maintainer="aurbuche <aurbuche@student.42.fr>"

#Install packages
RUN		apk update && \
		apk add nginx openrc openssh openssl
RUN		adduser -D -g 'www' www
RUN		mkdir /www
RUN		chown -R www:www /var/lib/nginx
RUN		chown -R www:www /www
RUN		ssh-keygen -A

#Setup Nginx
RUN		mkdir -p /etc/nginx && \
		mv srcs/nginx.conf /etc/nginx/ && \
		mv srcs/index/index.html /www/ && \
		mv srcs/index/index.css /www/ && \
		mv srcs/index/logo_wordpress.jpg /www && \
		mv srcs/index/logo_phpmyadmin.jpg /www

#Openssl
RUN		adduser -D admin && \
		echo "admin:password"|chpasswd && \
		yes "" | openssl req -x509 -nodes -days 365 -subj '/C=FR/ST=Auvergne-Rhone-Alpe/L=Lyon/CN=localhost' -newkey rsa:2048 -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt


RUN		mv start.sh ./ && \
		chmod +x /start.sh
CMD		sh ./start.sh

EXPOSE	22 80 443
