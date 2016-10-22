#!/bin/bash
# docker-install.sh
# Script de instalação do Docker-Engine para o Ubuntu 16.04 LTS.

source env.sh

# Atualizar e incluir chave para permitir instalação do pacote do Docker-Engine
# pelo APT
sudo apt-get update
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
apt-cache policy docker-engine

# Instalação do Docker-Engine
sudo apt-get install -y docker-engine

# Configurar o Docker CLI para ser usado sem precisar de ser usuário root
sudo usermod -aG docker $HOST_USER

echo "DOCKER instalado com sucesso!"
echo -e "\nSerá necessário fazer logout deste usuário.\n\n"

#read -p "Deseja fazer logout? " -n 1 -r
#echo

#if [[ ! $REPLY =~ ^[Yy]$ ]]
#then
#    exit 1
#fi

# Fazer logout
#pkill -KILL -u $HOST_USER
