#!/bin/bash

#Prints sh info stuff
echo Executing xnorm-python-sh
echo Author: skuzow
echo Vendor: xnormnet
echo Version: 1.0.1
echo Website: https://xnorm.cloud
echo Repository: https://github.com/xnormnet/docker-images

# Sets directory
cd /home/container

# Installs or Update python libraries
pip3 install -r requirements.txt --upgrade

# Prints current Python3, Pip3 Version
python3 --version
pip3 --version

# Makes internal Docker IP address available to processes
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Replaces Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Runs the Server
eval ${MODIFIED_STARTUP}
