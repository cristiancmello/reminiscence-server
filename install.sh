#!/bin/bash
# args: $1 = [--gpu | --cpu]

source env.sh

function server-install-msg-error
{
	echo $SERVER_MSG_ERROR
}

function server-install-or-start-gpu
{
	eval $NVIDIA_DOCKER_INSTALLER
	eval $TENSORFLOW_START_SERVER $1 $2
}

function server-install-or-start-cpu
{
	eval $TENSORFLOW_START_SERVER $1 $2
}

# Função para construir servidor a partir de um Dockerfile
function install-or-start-server
{
	# Se o segundo argumento tiver algo escrito, pare o script.
	if [[ !(-z "${2+set}") ]]; then
		server-install-msg-error
		exit
	fi

	if [[ "$1" == $TENSORFLOW_SERVER_ARG1_GPU ]]; then
		server-install-or-start-gpu $1 $2
	elif [[ "$1" == $TENSORFLOW_SERVER_ARG1_CPU ]]; then
		server-install-or-start-cpu $1 $2
	else
		if [[ !(-z "${1+set}") ]]; then
			server-install-msg-error
			exit
		fi
		
		server-install-or-start-cpu $1 $2
	fi
}

eval $DOCKER_INSTALLER
install-or-start-server $1 $2



