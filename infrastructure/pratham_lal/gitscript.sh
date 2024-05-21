#!/bin/bash

repo_url=$1
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

echo "Done Cloning and moved to target repo"

for branch in `git branch -r | grep -v HEAD`;do
        local_branch=${branch#origin/}

        if ! git rev-parse --quiet --verify $local_branch > /dev/null;
        then
                git checkout -b $local_branch $branch
        fi
done

echo "Total branches in this repository"
git branch --list
read -p 'Enter branch name to merge: ' branch_name

if [ $(git rev-parse --verify $branch_name 2>/dev/null) ];
then
        echo "Now merging $branch_name branch to main branch"
else
        echo "$branch_name branch doesn't exist"
        exit
fi

echo 'Swiching to main branch'
git checkout -b temp_branch
git checkout $branch_name
git merge temp_branch
git commit
git branch -d temp_branch
git checkout main

read -p 'Do you want to generate pull request? (y/n) ' pull_req

if [ "$pull_req" == 'y' ];
then
        git pull origin main
fi
git merge $branch_name

echo "$branch_name successfully got merged \n Now pushing the changes to main branch"

git push origin main

read -p "Do you want to remove $branch_name? (y/n) " remove_req

if [ "$remove_req" == 'y' ];
then
        git branch -d "$branch_name"
fi
echo "Merge and Push done successfully"