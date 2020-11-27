red="\e[91m"
green="\e[92m"
yellow="\e[93m"
blue="\e[94m"
purple="\e[95m"
white="\e[97m"


# # Clean the docker containers and other if exist
# printf "\033[0;34mWe will kill all containers already start!\n\033[0m"

clean_file()
{
	echo $blue"Clean files"$white
	docker system prune -a
	sudo pkill nginx
	sudo pkill mysql
	sudo minikube delete
	echo $green"File clean"
}

minikube_setup()
{
	echo $blue"Download kubectl & minikube"$white
	curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
	curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
		&& chmod +x minikube
	echo -n $blue"Setup minikube" && sleep 1 && echo -n "." && sleep 1 && echo -n "." && sleep 1 && echo "."$white
	sudo mkdir -p /usr/local/bin/
	sudo install minikube /usr/local/bin/
	rm minikube
	echo $green"Minikube setup!"$white
	echo $blue"Let's start minikube & kubectl"$white
	minikube start --driver=docker
	minikube status
	minikube kubectl
}

main()
{
	clean_file
	minikube_setup
}

main