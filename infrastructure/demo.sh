#!/bin/bash


if [ $# -ne 1 ]; then
    echo "Usage: $0 <repository_url>"
    exit 1
fi


repository_url="$1"

git clone "$repository_url"