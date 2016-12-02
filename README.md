# docker-openvpn-setup
Collection of shell scripts to setup docker-openvpn (using the *kylemanna/docker-openvpn* docker image)

#### Links
* [kylemanna/docker-openvpn](https://github.com/kylemanna/docker-openvpn)

## Quick Start
Prepare, run these commands one by one
```bash
git clone https://github.com/madcoda/docker-openvpn-setup.git
cd docker-openvpn-setup
chmod +x ./ovpn
cp .env.example .env

```
Edit .env with your favourite text editor e.g. ``` nano .env ```
```bash
# you can keep this unchanged, used for docker volume name
OVPN_DATA=ovpn-data
# use any port you like, e.g. 443 or keep this unchanged
OVPN_PORT=1194
# change to your domain name, or IP
OVPN_HOSTNAME=tcp://remote.example.com
# just a name, you can keep this unchanged
OVPN_DOCKER_NAME=ovpn
```

Setup which will generate all the certs, keys

you will be prompted to enter a Common Name, and PEM passphrase (required)

```bash
./ovpn init
./ovpn create
```
Create account for "john"

you will be prompted to enter the passphrase you previously entered

This command will generate a no-password client (modify the script if you want to set a password)

```bash
./ovpn buildclient john
./ovpn getclient john
```
You will then find a "john.ovpn" file in your current directory, send to your client


## Uninstall
If you don't want to use anymore, or messed up the settings, you can undo all of the above by these commands
```bash
# stop the container
./ovpn stop
# remove the container
./ovpn remove
# remove the data (all the ca certs, client certs etc)
./ovpn clean
```
