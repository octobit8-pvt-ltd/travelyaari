#!/bin/bash

repo_url=$1
new_branch=$2
target_dir=$(basename "$repo_url" .git)


if [ -d $target_dir ];
then
        echo "$target_dir does exist."
        rm -rf $target_dir
        git clone $repo_url
else
        git clone $repo_url
fi

cd $target_dir/

git branch $new_branch
git checkout $new_branch
git push $repo_url $new_branch
