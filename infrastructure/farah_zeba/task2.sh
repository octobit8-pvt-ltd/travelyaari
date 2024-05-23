#!/bin/bash

repo_url=$1
tag_name=$2
target_dir=$(basename "$repo_url" .git)


if [ -d $target_dir ];
then
        echo "$target_dir does exist."
        rm -rf $target_dir
fi

git clone $repo_url

cd "$target_dir"


git tag "$tag_name"
git push origin "$tag_name"