#!/bin/bash

echo "Stopping old container..."

docker rm -f devops-container

echo "Starting container..."

docker-compose up -d
