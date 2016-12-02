#!/bin/bash

# inject .env configs into the shell
if [ -f .env ]; then
	export $(cat .env | grep -v ^# | xargs)
else
	echo ".env file not found"
fi

docker rm $OVPN_DOCKER_NAME