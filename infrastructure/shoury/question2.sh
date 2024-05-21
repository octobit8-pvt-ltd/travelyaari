#!/bin/bash

username=$1
token=$2
repo_name=$3

collaborators=$(curl -s -u $username:$token "https://api.github.com/repos/$username/$repo_name/collaborators")


echo "$collaborators" | jq -r '.[] | "\(.login): admin=\(.permissions.admin), push=\(.permissions.push), pull=\(.permissions.pull)"'