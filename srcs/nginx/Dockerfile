# Image
FROM alpine:latest

LABEL maintainer="aurbuche <aurbuche@student.42.fr>"

#Install packages
RUN		apk update
RUN		apk add nginx openrc openssh openssl bash zsh --no-cache
RUN		adduser -D -g 'www' www
RUN		openrc
RUN		touch /run/openrc/softlevel

RUN		mkdir /www
RUN		chown -R www:www /var/lib/nginx
RUN		chown -R www:www /www
RUN		ssh-keygen -A

#Setup Nginx
RUN		mkdir -p /etc/nginx
COPY	srcs/nginx.conf /etc/nginx/nginx.conf
COPY	srcs/index/index.html var/www/html/

#Openssl
RUN		adduser -D admin && \
		echo "admin:password" | chpasswd && \
		yes "" | openssl req -x509 -nodes -days 365 -subj '/C=FR/ST=Auvergne-Rhone-Alpe/L=Lyon/CN=localhost' -newkey rsa:2048 -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

# COPY	srcs/start.sh ./
# RUN		chmod +x /start.sh
CMD		nginx -g 'daemon off;'

EXPOSE	22 80 443

# ///////////////////////////////////////// 


# FROM alpine:latest

# RUN apk -U upgrade --no-cache
# RUN apk add openssl \
#     && apk add nginx \
#     && apk add openssh \
#     && apk add bash \
#     && apk add zsh --no-cache

# RUN adduser -D -g www www
# RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache 
# RUN apk add openrc
# RUN openrc
# RUN touch /run/openrc/softlevel

# RUN mkdir /etc/telegraf/
# COPY srcs/telegraf.conf /etc/telegraf/telegraf.conf
# # We setup web server files and permissions
# RUN mkdir /www
# RUN chown -R www:www /var/lib/nginx
# RUN chown -R www:www /www
# RUN mkdir -p /run/nginx

# # Create SSL
# RUN adduser -D admin
# RUN echo "admin:password" | chpasswd
# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=AuvergneRhone-alpes/L=Lyon/O=tcluadel/OU=aurbuche/CN=aurbuche" -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

# # Create SSH
# RUN mkdir -p /etc/ssh
# RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssh/ssh_host_rsa_key -keyout /etc/ssh/ssh_host_rsa_key -subj "/C=FR/ST=AuvergneRhone-alpes/L=Lyon/O=tcluadel/OU=tclaudel/CN=tclaudel"
# RUN chmod 600 /etc/ssh/ssh_host_rsa_key

# COPY srcs/nginx.conf /etc/nginx/nginx.conf
# COPY srcs/index.html /var/www/html/
# # /etc/init.d/
# CMD telegraf --config /etc/telegraf/telegraf.conf & /usr/sbin/sshd; nginx -g 'daemon off;'

# EXPOSE 22 80 443