#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 command{run/stop/kill/rm} container{name/id} hostPortNumber containerPortNumber imageName {portNumber and imageName applicable only if command is run}"
    exit 1
fi

command="$1"
containerId="$2"
hostPortNumber="$3"
containerPortNumber="$4"
imageName="$5"

case $command in 
    "run")
        if docker inspect "$containerId" &>/dev/null; then
            echo "Container with name or ID '$containerId' already exists."
            echo "Please remove the existing container or choose a different name/ID."
            exit 1
        fi
        
        if [ -z "$hostPortNumber" ] || [ -z "$containerPortNumber" ] || [ -z "$imageName" ]; then
            echo "For 'run' command, hostPortNumber, containerPortNumber, and imageName are required."
            echo "Usage: $0 run containerId hostPortNumber containerPortNumber imageName"
            exit 1
        fi
        docker run -d --name "$containerId" -p "$hostPortNumber:$containerPortNumber" "$imageName"
        ;;
    
    "stop")
        docker "$command" "$containerId"
        ;;

    "rm")
        docker "$command" "$containerId"
        ;;

    "kill")
        docker "$command" "$containerId"
        ;;

    *)
        echo "Invalid command. Use 'run','rm' ,'stop', or 'kill'."
        exit 1
        ;;
esac
