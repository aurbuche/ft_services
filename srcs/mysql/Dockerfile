FROM	alpine:3.12

LABEL	maintainer="aurbuche <aurbuche@student.42lyon.fr>"

#Packages
RUN		apk upgrade
RUN		apk update
RUN		apk add openrc vim --no-cache
RUN		apk add mariadb mariadb-common mariadb-client

RUN		openrc
RUN		service mariadb start
RUN		status

RUN		printf "\033[0;32mMySQL is install and started!\033[0m\n"
