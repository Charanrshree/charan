#!/bin/bash

# Function to stop and remove a container by name or ID
remove_container() {
    container_id=$(docker ps -a -q --filter "name=$1")
    if [ -n "$container_id" ]; then
        echo "Stopping container $1..."
        docker stop "$container_id"
        echo "Removing container $1..."
        docker rm "$container_id"
        echo "Container $1 removed."
    else
        echo "No container found with name or ID: $1"
    fi
}

# Function to remove a Docker image by name or ID
remove_image() {
    image_id=$(docker images -q "$1")
    if [ -n "$image_id" ]; then
        echo "Removing image $1..."
        docker rmi "$image_id"
        echo "Image $1 removed."
    else
        echo "No image found with name or ID: $1"
    fi
}

# Check for the correct number of arguments
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <container_name> <image_name>"
    exit 1
fi

# Assign container and image names
container_name=$1
image_name=$2

# Remove the container
remove_container "$container_name"

# Remove the image
remove_image "$image_name"
