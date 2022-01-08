#!/bin/bash

#Prints sh version
echo Executing sh v1.0.1

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
