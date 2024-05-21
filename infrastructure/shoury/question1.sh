#!/bin/bash

read  "Enter username: " username

echo

read -p "Enter directory name in which you want to create backup of all repos: " dir
mkdir -p  "$dir"

cd $dir/

repos=$(curl -s "https://api.github.com/users/$username/repos?per_page=10"| jq -r '.[].clone_url' )
echo $username

for repo in repos;do
        git clone "$repos"
done
