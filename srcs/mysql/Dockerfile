FROM	alpine:3.12

LABEL	maintainer="aurbuche <aurbuche@student.42lyon.fr>"

#Packages
RUN		apk upgrade
RUN		apk update
RUN		apk add openrc vim --no-cache
RUN		apk add mysql mysql-client
RUN		apk add wget

CMD		./setup.sh

RUN		echo "\033[38;2;0;128;0mThe database is up!\033[0m"
