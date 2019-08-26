#!/usr/bin/env bash

# PLEASE READ THIS
# ****************
# STOPS AND THEN DELETES/WIPES/REMOVES ALL DOCKER CONTAINERS/IMAGES ON UPLINKUR ENTIRE MACHINE
# ****************
# PLEASE READ THIS

set -e

PS_AQ=$(docker ps -aq)
IMAGES_Q=$(docker images -q)

echo ' STOPPING ALL CONTAINERS'
docker stop $PS_AQ

echo 'DELETING ALL CONTAINERS'
docker rm $PS_AQ --force

echo 'DELETING ALL IMAGES'
docker rmi $IMAGES_Q --force
