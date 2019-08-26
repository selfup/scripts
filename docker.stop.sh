#!/usr/bin/env bash

# STOPS ALL RUNNING DOCKER CONTAINERS

set -e

PS_AQ=$(docker ps -aq)

echo 'STOPPING ALL RUNNING CONTAINERS'

docker stop $PS_AQ

echo 'ALL CONTAINERS STOPPED'
