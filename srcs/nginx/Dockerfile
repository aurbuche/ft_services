# Image
FROM	alpine:3.12

LABEL	maintainer="aurbuche <aurbuche@student.42lyon.fr>"

RUN		apk update
RUN		apk add nginx
RUN		apk add openssl
RUN		apk add openrc --no-cache
RUN		apk add sudo vim git

RUN		adduser -D -g 'www' www
RUN		mkdir /www
RUN		chown -R www:www /var/lib/nginx
RUN		chown -R www:www /www
COPY	nginx.conf /etc/nginx/nginx.conf
COPY	index.html /www/

RUN		mkdir -p /run/nginx /www/etc/nginx/ssl

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt \
		-subj "/C=FR/ST=Auvergner-Rhone-Alpes/L=Lyon/O=42Lyon/CN=localhost/emailAddress=aurbuche@student.42lyon.fr"

EXPOSE	80 443

CMD		nginx -g 'daemon off;'