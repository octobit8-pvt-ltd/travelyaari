#!/bin/bash

service_name=$1

if systemctl is-active --quiet $service_name
then
    echo "$service_name is running"
else
    echo "$service_name is not running, restarting..."
    systemctl start $service_name
fi