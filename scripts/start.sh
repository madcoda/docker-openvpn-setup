#!/bin/bash

# inject .env configs into the shell
if [ -f .env ]; then
	export $(cat .env | grep -v ^# | xargs)
else
	echo ".env file not found"
fi

docker run -v $OVPN_DATA:/etc/openvpn -d -p $OVPN_PORT:1194 --name $OVPN_DOCKER_NAME --cap-add=NET_ADMIN kylemanna/openvpn