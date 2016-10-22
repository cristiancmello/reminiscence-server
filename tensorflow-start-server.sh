#!/bin/bash
# tensorflow-start-server.sh
# Script para inicialização somente ou download e inicialização do servidor
# com container do tensorflow com suporte a CPU ou GPU NVIDIA, somente.

# Carregar definições globais de ambiente.
source env.sh

function server-msg-error
{
	echo $SERVER_MSG_ERROR
}

function server-gpu-start
{
	eval $NVIDIA_DOCKER_EXEC
}

function server-cpu-start
{
	eval $DOCKER_EXEC
}

# Função para iniciar servidor (suporte a CPU ou GPU)
function start-server
{
	# Se o segundo argumento tiver algo escrito, pare o script.
	if [[ !(-z "${2+set}") ]]; then
		server-msg-error
		exit
	fi

	if [[ "$1" == $TENSORFLOW_SERVER_ARG1_GPU ]]; then
		server-gpu-start
	elif [[ "$1" == $TENSORFLOW_SERVER_ARG1_CPU ]]; then
		server-cpu-start
	else
		if [[ !(-z "${1+set}") ]]; then
			server-msg-error
			exit
		fi
		
		server-cpu-start
	fi
}

# Criar diretório compartilhado com o container
mkdir -p $HOST_FOLDER_SHARED

# Dar propriedade da pasta de compartilhamento criada como do usuário host
chown $HOST_USER:$HOST_USER $HOST_FOLDER_SHARED

# Iniciar servidor ($1 e $2 são argumentos de linha de cmd. para o executável)
start-server $1 $2

