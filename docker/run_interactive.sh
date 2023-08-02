#!/bin/bash
# This script can be used to run commands inside the docker container.

# can modify this to use different GPUs

export HOST_USER_ID=$(id -u)
DOCKER_IMG="fastchat:latest"

# Construct instance name using the current username and the current time.
# This is useful for running multiple instances of the docker container.
DOCKER_INSTANCE_NAME="fastchat_${USER}_$(date +%Y%m%d_%H%M%S)"

docker run \
    -e HOST_USER_ID \
    -it \
    -v `pwd`:/home/fastchat/fastchat \
    -v /shared/nas/data/m1/xingyao6/.cache:/home/fastchat/.cache \
    -p 8000:8000 \
    --rm \
    --env CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES \
    --gpus all \
    --name $DOCKER_INSTANCE_NAME \
    $DOCKER_IMG \
    bash -c "cd /home/fastchat/fastchat && ./docker/entry.sh"
