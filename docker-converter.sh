#!/bin/bash

# $1 = path to sdk zip files
# $2 = destination to put p2 repositories

if [ $# -ne 2 ]; then
    echo "Usage: docker-converter /path/to/sdk-files /p2/destination/folder"
    echo "You must use absolute paths"
    exit -1
fi

sudo docker build docker -t p2-creation
sudo docker run -v $1:/sdks -v $2:/output -i -t p2-creation
sudo chown -R $USER $2/*
