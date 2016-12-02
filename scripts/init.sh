#!/bin/bash

# inject .env configs into the shell
if [ -f .env ]; then
	export $(cat .env | grep -v ^# | xargs)
else
	echo ".env file not found"
fi

docker pull kylemanna/openvpn
docker volume create --name $OVPN_DATA
docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u $OVPN_HOSTNAME
docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn ovpn_initpki
