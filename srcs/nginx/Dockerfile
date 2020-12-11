# Image
FROM alpine:latest

LABEL maintainer="aurbuche <aurbuche@student.42.fr>"

#Install packages
RUN		apk update
RUN		apk add nginx
RUN		apk add openrc --no-cache
RUN		apk add openssh
RUN		apk add openssl
RUN		apk add bash
RUN		apk add zsh

RUN		adduser -D -g 'www' www
RUN		openrc
RUN		touch /run/openrc/softlevel

RUN		mkdir /www
RUN		chown -R www:www /var/lib/nginx
RUN		chown -R www:www /www
RUN		mkdir -p /etc/nginx
RUN		ssh-keygen -A

#Openssl
RUN		adduser -D admin && \
		echo "admin:password" | chpasswd && \
		openssl req -x509 -nodes -days 365 -subj '/C=FR/ST=Auvergne-Rhone-Alpe/L=Lyon/CN=localhost' -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

#Setup Nginx
# RUN		rm -rf /etc/nginx/nginx.conf
COPY	srcs/nginx.conf /etc/nginx/nginx.conf
COPY	srcs/index.html /www/html/

CMD		nginx -g 'daemon off;'

EXPOSE	22 80 443

RUN		printf "\033[0;32mAfter that everything will be OK, you can go to https://localhost and see your container ✅\n\033[0m"