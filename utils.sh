#! /bin/bash
date_today=$(date)
echo "Today is: $date_today"


echo "Installing all common tools"
sudo dnf -y group install "Development Tools"
# Installing Nginx
echo "Installing Nginx..."
sudo dnf install nginx

# Installing Docker
echo "Installing Docker..."
sudo dnf remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Installing GCC complier
echo "Installing GCC complier..."
sudo dnf install gcc

# Installing Go
echo "Installing Golang..."
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.3.linux-amd64.tar.gz
sudo dnf install golang
mkdir -p $HOME/go
echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc
source $HOME/.bashrc
go env GOPATH

