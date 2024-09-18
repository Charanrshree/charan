#!/bin/bash

# Check if the correct number of arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <container_name> <image_name>"
    exit 1
fi

# Assign arguments to variables
container_name=$1
image_name=$2

# Function to stop the container
stop_container() {
    container_id=$(docker ps -a -q --filter "name=$container_name")
    if [ -n "$container_id" ]; then
        echo "Stopping container $container_name..."
        docker stop "$container_id"
        echo "Container $container_name stopped."
        echo "Removing container $container_name..."
        docker rm "$container_id"
        echo "Container $container_name removed."
    else
        echo "No container found with name: $container_name"
    fi
}

# Function to remove the image
remove_image() {
    image_id=$(docker images -q "$image_name")
    if [ -n "$image_id" ]; then
        echo "Removing image $image_name..."
        docker rmi "$image_id"
        echo "Image $image_name removed."
    else
        echo "No image found with name: $image_name"
    fi
}

# Stop the container and remove the image
stop_container
remove_image
