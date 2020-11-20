# Clean the docker containers and other if exist
echo "We will kill all containers already start!"
docker system prune -a
sudo pkill nginx
sudo pkill mysql
sudo minikube delete

# To pre-empt errors of Kubernetes
echo "Go pre-empt all possible errors"
sudo mkdir /sys/fs/cgroup/systemd
sudo mount -t cgroup -o none,name=systemd cgroup /sys/fs/cgroup/systemd

# Only for Linux
sudo groupadd docker
sudo usermod -aG docker $USER

# Prerequisite
sudo apt-get update && \
	 apt-get install -y apt-transport-https
curl -s https://packages.cloud.goolge.com/apt/doc/apt-key/gpg
sudo apt-key add
echo "deb http://apt.kubernetes.io/kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# Install && start minikube
echo "You're gonna download minikube"
rm -rf /home/user42/.minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
	&& chmod +x minikube
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/
rm minikube
printf "\033[0;34mminikude is now downloaded, it will start\n\033[0m"

