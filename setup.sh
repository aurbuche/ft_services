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
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

# Install && start minikube
echo "You're gonna download minikube"
rm -rf /home/user42/.minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
	&& chmod +x minikube
sudo mkdir -p /usr/local/bin/
sudo install minikube /usr/local/bin/
rm minikube
printf "\033[0;34mminikude is now downloaded, it will start\n\033[0m"

