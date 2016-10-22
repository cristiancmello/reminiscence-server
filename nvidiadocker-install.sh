#!/bin/bash
# nvidiadocker-install.sh
# Script para instalação do utilitário do NVIDIA-DOCKER.

# Download do pacote DEB do nvidia-docker
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.0-rc.3/nvidia-docker_1.0.0.rc.3-1_amd64.deb

# Instalação do pacote do nvidia-docker
sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb

echo "NVIDIA-DOCKER instalado com sucesso!"
