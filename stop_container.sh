#!/bin/bash
set -e

#stop the running container (if any)
containerid='sudo docker ps | awk -F ""'{print $1}''
sudo docker rm -f $containerid
