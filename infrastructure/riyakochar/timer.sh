#!/bin/bash
dir_path=$1
days=$2

if [[ -z "$dir_path" || -z "$days" ]]; then
            echo "Missing argument"
                exit
fi

if [[ ! -d "$dir_path" ]]; then
            echo "Error: Directory $dir_path does not exist"
                exit
fi

old_files=$(find "$dir_path" -mtime +$days -print)



if [[ -n "$old_files" ]]; then
          echo "Following files are older than $days: "
          echo "$old_files"
          echo "Deleting the files listed above"
          find $dir_path -type f -mtime +$days -delete
          if [[ -n "$(find "$dir_path" -mtime +$days -print)" ]];then
                  echo "Failed to delete"
          else
              echo "Done deleting files that are older than $days."
          fi