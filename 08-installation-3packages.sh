#!/bin/bash

USERID=$(id -u)

if [ $? -ne 0 ]; then
    echo "ERROR::Please run the script with root privileges"
    exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "Inatlalling MYSQL is failure"
else
    echo "Installing MYSQL is SUCCESS"
fi

dnf install nodejs -y

if [ $? -ne 0 ]; then
    echo "Inatlling NODEJS is failure"
else
    echo "Installing NodeJS is SUCCESS"
fi

dnf install nginx -y

if [ $? -ne 0 ]; then
    echo "Installing NGINX is failure"
else
    echo "Installing NGINX is SUCCESS"
fi