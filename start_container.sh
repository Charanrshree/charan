#!/bin/bash
set -e

# Pull the image from docker hub
docker pull charanshree/charan:latest

# Start the container with docker image
docker run -d -p 5000:5000 charanshree/charan:latest
