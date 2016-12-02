#!/bin/bash

# inject .env configs into the shell
if [ -f .env ]; then
	export $(cat .env | grep -v ^# | xargs)
else
	echo ".env file not found"
fi

./dotenv.sh docker-compose up -d