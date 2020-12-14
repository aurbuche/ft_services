# Image
FROM alpine:3.7

FROM alpine:latest

RUN apk update
RUN apk add nginx
RUN apk add openssl

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/index.html /www/

RUN mkdir -p /run/nginx /www /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt \
    -subj "/C=FR/ST=France/L=Lyon/O=42Lyon/OU=42Network/CN=localhost/emailAddress=akerdeka@student.42lyon.fr"

EXPOSE 80 443

CMD nginx -g 'pid /tmp/nginx.pid; daemon off;'