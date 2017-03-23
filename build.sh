#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Usage: $0 <tag> [child_image]"
    exit 1
fi

echo "Building base image with tag: $1"
docker build -t base:$1 $(pwd)

if [ $# -eq 2 ]; then
    echo "Building $2 image with tag: $1"
    docker build -t base-$2:$1 $(pwd)/$2
fi
