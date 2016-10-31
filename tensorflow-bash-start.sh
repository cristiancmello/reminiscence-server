#!/bin/bash
# tensorflow-bash-start.sh
# Script para iniciar um TTY com o container do tensorflow.

source env.sh

TENSORFLOW_CONTAINER_ID=$(docker ps -q --filter ancestor=$TENSORFLOW_SERVER_URL_GPU)

docker exec -it $TENSORFLOW_CONTAINER_ID bash
