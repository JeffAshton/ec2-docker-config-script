#!/bin/bash

if [ -z "$EC2_USERNAME" ]; then
  EC2_USERNAME=ubuntu
fi

if [ -z "$DOCKER_COMPOSE_VERSION" ]; then
  DOCKER_COMPOSE_VERSION=1.4.2
fi

apt-get update -y

# docker
curl -sSL https://get.docker.com | sh

# docker-compose
curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose --version | awk 'NR==1{print $NF}')/contrib/completion/bash/docker-compose > /etc/bash_completion.d/docker-compose

sudo usermod -aG docker "$EC2_USERNAME"

