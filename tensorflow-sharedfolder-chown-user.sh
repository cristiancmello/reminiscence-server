#!/bin/bash
# tensorflow-sharedfolder-chown-user.sh
# Script para habilitar leitura/escrita/execução da pasta compartilhada para o 
# usuário que criou o servidor.

source env.sh

sudo chown -R $HOST_USER:$HOST_USER $HOST_FOLDER_SHARED

