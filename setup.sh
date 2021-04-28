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
	kubectl delete service nginx-service && kubectl delete deployment nginx-deployment
	docker system prune -a
	pkill -9 nginx
#	pkill mysql
	minikube stop
	minikube delete
	printf "${Green}File clean!\n"
}

function MINIKUBE_SETUP {
  printf "${Blue}Download kubectl & minikube.\n${White}"
  curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl \
    && chmod +x ./kubectl
  curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-darwin-amd64 \
    && chmod +x minikube
  printf "${Green}Minikube setup!\n${White}"
  printf "${Blue}Let's start minikube & kubectl.\n${White}"
  minikube start --vm-driver=virtualbox
  minikube status
}

function METALLB_SETUP {
  printf "${Blue}Download metallb.${NoColor}\n"
  kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
  kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
  kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
  kubectl apply -f srcs/metallb/srcs/metallbConfigMap.yaml
}

function NGINX_SETUP {
  docker build -t nginx_server srcs/nginx
  docker images
  kubectl apply -f srcs/nginx/nginx.yaml
}

function MYSQL_SETUP {
  docker build -t mysql_db srcs/mysql
#  kubectl apply -f srcs/mysql/srcs/mysql_service.yaml
}

#function PHPMYADMIN_SETUP {
#	docker build -t phpmyadmin_server srcs/phpmyadmin
#	printf "${Green}PHPMyAdmin is setup!\n${NoColor}"
#}

function NGINX_RESTART {
  docker image rm nginx_server
  docker stop nginx_server && docker rm nginx_server
  docker system prune -a
  D NGINX_SETUP
}

# function METALLB_RESTART {

# }

function STOP {
  kubectl delete service nginx-service && kubectl delete deployment nginx-deployment
#  docker stop nginx_server && docker rm nginx_server
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
    clean)
      D CLEAN_FILE
    ;;
	  metallb)
	  D METALLB_SETUP
	  ;;
	  nginx)
	    D NGINX_SETUP
	  ;;
	  mysql)
	    D MYSQL_SETUP
	  ;;
		restart)
		case $2 in
			nginx)
			kubectl delete service nginx-service && kubectl delete deployment nginx-deployment
			D NGINX_RESTART
			;;
			metallb)
			# METALLB_RESTART
			;;
			*)
			kubectl delete service nginx-service && kubectl delete deployment nginx-deployment
			NGINX_RESTART
			# METALLB_RESTART
			;;
		esac
	esac
else
	I=0
  eval $(minikube docker-env)
	D CLEAN_FILE
	D MINIKUBE_SETUP
  eval $(minikube docker-env)
	D METALLB_SETUP
	D NGINX_SETUP
# D MYSQL_SETUP
#	D PHPMYADMIN_SETUP
fi

# Command:

#	docker run -d --name="nginx_server" -p 80:80 -p 443:443 nginx_server
#	eval $(minikube docker-env)

#eval $(minikube docker-env)
#docker build -t nginx_server srcs/nginx
#kubectl apply -f srcs/nginx/nginx.yaml