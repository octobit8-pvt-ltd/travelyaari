#!/bin/bash

echo "Enter your repository HTTPS URL"
read Repo_Url

repo_name=$(basename $Repo_Url .git)
username=$(basename $(dirname $Repo_Url))

ssh_url="git@github.com:$username/$repo_name.git"

git remote set-url origin $ssh_url

new_url=$(git remote get-url origin)
echo "The remote URL:- $new_url"