#!/bin/bash


# creating a backup for the server

CONTAINER_ID=$(docker ps | grep "riceai_conv-server" | awk '{print $1}')

docker cp $CONTAINER_ID:/code/cnn_server_authentication/media . && zip -r "$(date +%Y-%m-%d-%H-%M-%S)".zip media/

rm -rf media/
