#Image
FROM alpine:latest

LABEL maintainer="aurbuche <aurbuche@student.42.fr>"

#Install packages
RUN		apk update
RUN		apk add nginx openrc openssh openssl
RUN		adduser -D -g 'www' www
RUN		mkdir /www
RUN		chown -R www:www /var/lib/nginx
RUN		chown -R www:www /www
RUN		ssh-keygen -A

#Setup Nginx
RUN		mkdir -p /etc/nginx
COPY	srcs/nginx.conf /etc/nginx/
COPY	srcs/index/index.html /www/
COPY	srcs/index/index.css /www/
COPY	srcs/index/logo_wordpress.jpg /www/
COPY	srcs/index/logo_phpmyadmin.jpg /www/

#Openssl
RUN		adduser -D admin && \
		echo "admin:password"|chpasswd && \
		yes "" | openssl req -x509 -nodes -days 365 -subj '/C=FR/ST=Auvergne-Rhone-Alpe/L=Lyon/CN=localhost' -newkey rsa:2048 -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt


COPY	srcs/start.sh ./
RUN		chmod +x /start.sh
CMD		sh ./start.sh

EXPOSE	22 80 443
