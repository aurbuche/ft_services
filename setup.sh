#Install && start minikube
echo "You're gonna download kubectl to use minikube"
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
	&& chmod +x minikube
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/

minikube start --driver=virtualbox
minikube status

#Install kubectl
