#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run the script with root privileges"
    exit 1
fi

dnf remove mysql -y

if [ $? -ne 0 ]; then
    echo "Uninstalling MYSQL is failure"
else   
    echo "Uninstalling MYSQL is SUCCSS"
fi

dnf remove nodejs -y

if [ $? -ne 0 ]; then
    echo "Uninstalling nodejs is failure"
else 
    echo "Uninstalling NodeJS is SUCCESS"
fi

dnf remove nginx -y

if [ $? -ne 0 ]; then
    echo "Uninstalling nginx is failure"
else
    echo "Uninstalling nginx is Success"
fi