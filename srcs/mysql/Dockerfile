FROM	alpine:latest

LABEL	maintainer="aurbuche <aurbuche@student.42lyon.fr>"

#Packages
RUN		apk update
RUN		apk add openrc vim --no-cache
RUN		apk add mariadb mariadb-common mariadb-client


RUN		openrc
RUN		touch /run/openrc/softlevel



RUN		printf "MySQL is install!"
