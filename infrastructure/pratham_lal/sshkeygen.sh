#!/bin/bash

user_email=$1

if [ -z "$user_email" ];
then
        echo "Email address not found" 
        echo "Can't generate SSH Key"
        exit
fi

ssh-keygen -t rsa -b 4096 -C '$user_email' -f ~/.ssh/id_rsa

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_rsa