#!/bin/bash

source env.sh

function server-build-msg-error
{
	echo $SERVER_MSG_ERROR
}

function server-build-gpu
{
	eval $NVIDIA_DOCKER_BUILD
}

function server-build-cpu
{
	eval $DOCKER_BUILD
}

# Função para construir servidor a partir de um Dockerfile
function build-server
{
	# Se o segundo argumento tiver algo escrito, pare o script.
	if [[ !(-z "${2+set}") ]]; then
		server-build-msg-error
		exit
	fi

	if [[ "$1" == $TENSORFLOW_SERVER_ARG1_GPU ]]; then
		server-build-gpu
	elif [[ "$1" == $TENSORFLOW_SERVER_ARG1_CPU ]]; then
		server-build-cpu
	else
		if [[ !(-z "${1+set}") ]]; then
			server-build-msg-error
			exit
		fi
		
		server-build-cpu
	fi
}

build-server $1 $2