#!/bin/bash
set -e

# Remove stopped containers older than 24 hours
sudo docker container prune -f --filter "until=24h"

# Remove unused images
sudo docker image prune -a -f
