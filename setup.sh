#!/bin/bash

NoColor="\033[0m"
Black="\033[0;30m"
Red="\033[0;31m"
Green="\033[0;32m"
Yellow="\033[0;33m"
Blue="\033[0;34m"
Purple="\033[0;35m"
Cyan="\033[0;36m"
White="\033[0;37m"

function CLEAN_FILE {
	printf "${Blue}Clean files\n${White}"
	docker system prune -a
	pkill nginx
	pkill mysql
	minikube stop
	minikube delete
	printf "${Green}File clean!\n"
}

function MINIKUBE_SETUP {
	printf "${Blue}Download kubectl & minikube.\n${White}"
	# kubectl
	curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl
	chmod +x ./kubectl
	# mv ./kubectl /usr/local/bin/kubectl
	# minikube
	curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64 \
		&& chmod +x minikube
	printf "${Green}Minikube setup!\n${White}"
	printf "${Blue}Let's start minikube & kubectl.\n${White}"
	minikube start --driver=virtualbox
	minikube status
}

function NGINX_SETUP {
	docker build -t nginx_server srcs/nginx
	docker images
	# docker run -d -p 80:80 -p 443:443 nginx_server
	kubectl apply -f srcs/nginx/srcs/nginx.yaml
}

function NGINX_RESTART {
	docker rm nginx_server
	docker system prune -a
	D NGINX_SETUP
}

function STOP {
	minikube stop
	minikube delete
	rm minikube
	rm kubectl
}

function D {
  printf "${Purple}[$I] $1\n${NoColor}" | tr '_' ' '
  ((I++))
  eval $1
  if [[ $? -ne 0 ]]; then
    printf "An error occurred, exiting ..."
    exit;
  fi
}

if [[ $# -ne 0 ]]
then
	case $1 in
		stop)
		I=0
		D STOP
		;;
		restart)
		case $2 in
			nginx)
			NGINX_RESTART
			;;
			*)
			NGINX_RESTART
			;;
		esac
	esac
else
	I=0
	D CLEAN_FILE
	D MINIKUBE_SETUP
	D NGINX_SETUP
fi

