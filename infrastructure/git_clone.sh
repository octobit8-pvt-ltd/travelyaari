#!/bin/bash

repo_url=$1
target_dir=$2
filename=$3
echo $target_dir
if [ -d $target_dir ];
then
	echo "$target_dir does exist."
	rm -rf $target_dir
	git clone $repo_url
else
	mkdir $target_dir
	git clone $repo_url
fi

cd $target_dir

if [ -f $filename ];
then
	echo "file exists".
fi
