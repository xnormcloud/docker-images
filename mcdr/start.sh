#!/bin/bash

#Prints sh info stuff
echo Executing xnorm-mcdr-sh
echo Author: legendnightt
echo Vendor: xnormnet
echo Version: 1.0.2
echo Website: https://xnorm.cloud
echo Repository: https://github.com/xnormnet/docker-images

#Set directory
cd /home/container

# Update python libraries
pip3 install mcdreforged hjson docker requests googletrans==4.0.0rc1 --upgrade

# Init mcdr in container home directory
python3 -m mcdreforged init

# Print current Java, Python3, Pip3 Version
java -version
python3 --version
pip3 --version

# Make internal Docker IP address available to processes
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
