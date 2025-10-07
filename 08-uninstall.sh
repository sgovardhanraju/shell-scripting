#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run the script with root previleges"
    exit 1
fi

dnf remove mysql -y

if [ $? -ne 0 ]; then
    echo "Uninstalling MYSQL is failure"
else   
    echo "Uninstalling MYSQL is SUCCSS"
fi