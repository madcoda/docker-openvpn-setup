#!/bin/bash

# inject .env configs into the shell
if [ -f .env ]; then
	export $(cat .env | grep -v ^# | xargs)
else
	echo ".env file not found"
fi

docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient $1 > $1.ovpn
