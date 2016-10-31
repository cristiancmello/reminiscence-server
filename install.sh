#!/bin/bash
# args: $1 = [--gpu | --cpu]

source env.sh

function server-install-msg-error
{
	echo $SERVER_MSG_ERROR
}

function server-install-or-start-help
{
	echo -e "Uso: rem [--cpu | --gpu | --help]"
	echo -e "Opções:"
	echo -e "\t--help\t\tMostra informações de ajuda."
	echo -e "\t--cpu\t\t Instala/Inicia servidor com suporte somente para CPU."
	echo -e "\t--gpu\t\t Instala/Inicia servidor com suporte a GPU.\n"
	echo -e "Exemplos:"
	echo -e "\trem\t\t Instala ou Inicia o servidor do Reminiscence para CPU, somente (padrão)."
	echo -e "\trem --gpu\t\t Instala ou Inicia o servidor do Reminescence com suporte a GPU NVIDIA."
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
	
	if [[ "$1" == $REM_INSTALL_START_ARG_HELP ]]; then
		server-install-or-start-help
		exit
	elif [[ "$1" == $TENSORFLOW_SERVER_ARG1_GPU ]]; then
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

install-or-start-server $1 $2
