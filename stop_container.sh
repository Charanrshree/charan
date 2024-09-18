#!/bin/bash

# Define the port number to check
PORT=5000

# Find the container that is using the port (if any)
existing_container=$(docker ps -q --filter "publish=$PORT")

# If a container is found using the port, stop and remove it
if [ -n "$existing_container" ]; then
    echo "A container is using port $PORT. Stopping and removing it..."
    docker stop "$existing_container"
    docker rm "$existing_container"
    echo "Stopped and removed container using port $PORT."
