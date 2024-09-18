#!/bin/bash
set -e

#stop the running container (if any)
containerid='docker ps | awk -F ""'{print $1}''
docker rm -f $containerid
