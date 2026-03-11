#!/bin/bash

IMAGE_NAME=devops-build

echo "Building Docker Image..."

docker build -t $IMAGE_NAME .

echo "Docker Image Built Successfully"
