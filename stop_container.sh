#!/bin/bash
set -e

# Stop and remove the running container (if any)
containerid=$(sudo docker ps -q)

# Check if any container is running
if [ -n "$containerid" ]; then
    echo "Stopping and removing the running container(s): $containerid"
    sudo docker rm -f $containerid
else
    echo "No running containers to stop."
fi
