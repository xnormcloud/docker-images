#!/bin/bash

#Prints sh version
echo Executing sh v0.0.1

#Set directory
cd /home/container

# Print current Java Version
java -version

# Make internal Docker IP address available to processes
export INTERNAL_IP=`ip route get 1 | awk '{print $NF;exit}'`

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
