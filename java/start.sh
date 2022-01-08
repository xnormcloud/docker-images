#!/bin/bash

#Prints sh info stuff
echo Executing xnorm-java-sh
echo Author: legendnightt
echo Vendor: xnormnet
echo Version: 1.0.0
echo Website: https://xnorm.cloud
echo Repository: https://github.com/xnormnet/docker-images

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
