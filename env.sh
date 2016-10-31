#!/bin/bash
# env.sh
# Arquivo com definições globais do servidor do REMiniscence.

# Local padrão da pasta de compartilhamento do hospedeiro
HOST_FOLDER_SHARED=~/tensorflow

HOST_USER=$(whoami)
CONTAINER_USER=$(whoami)

# Local padrão da pasta de compartilhamento no container (ou convidado)
# Por convenção, a pasta workspace ficará na pasta de usuários do container.
CONTAINER_USER_FOLDER_SHARED=/home/$CONTAINER_USER/workspace

# Porta padrão do hospedeiro
HOST_PORT=8888

# Porta padrão do container
CONTAINER_PORT=8888

REM_INSTALL_START_ARG_HELP="--help"
TENSORFLOW_SERVER_ARG1_GPU="--gpu"
TENSORFLOW_SERVER_ARG1_CPU="--cpu"
TENSORFLOW_SERVER_ARG2_BUILD="--build"
TENSORFLOW_SERVER_ARG2_BASH="--bash"
TENSORFLOW_SERVER_URL_GPU=gcr.io/tensorflow/tensorflow:latest-gpu
TENSORFLOW_SERVER_URL_CPU=gcr.io/tensorflow/tensorflow

TENSORFLOW_CONTAINER_NAME_GPU=$TENSORFLOW_SERVER_URL_GPU
TENSORFLOW_CONTAINER_NAME_CPU=$TENSORFLOW_SERVER_URL_CPU

DOCKERFILE_GPU_NAME=Dockerfile_gpu
DOCKERFILE_CPU_NAME=Dockerfile_cpu

DOCKER_INSTALLER="./docker-install.sh "
NVIDIA_DOCKER_INSTALLER="./nvidiadocker-install.sh "
TENSORFLOW_START_SERVER="./tensorflow-start-server.sh "
TENSORFLOW_BUILD="./tensorflow-build-dockerfile.sh "
DOCKER_EXEC_BASH="./tensorflow-bash-start.sh "

SERVER_MSG_ERROR="Argumentos inválidos."

DOCKER_EXEC="docker run -it -p $HOST_PORT:$CONTAINER_PORT \
	-v $HOST_FOLDER_SHARED:$CONTAINER_USER_FOLDER_SHARED $TENSORFLOW_CONTAINER_NAME_CPU"

DOCKER_BUILD="docker build -f $DOCKERFILE_CPU_NAME -t $TENSORFLOW_CONTAINER_NAME_CPU ."

NVIDIA_DOCKER_EXEC="nvidia-docker run -it -p $HOST_PORT:$CONTAINER_PORT \
	-v $HOST_FOLDER_SHARED:$CONTAINER_USER_FOLDER_SHARED $TENSORFLOW_CONTAINER_NAME_GPU"

NVIDIA_DOCKER_BUILD="nvidia-docker build -f $DOCKERFILE_GPU_NAME \
	-t $TENSORFLOW_CONTAINER_NAME_GPU ."

