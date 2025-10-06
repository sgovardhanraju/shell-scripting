#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run the script with root previleges"
    exit 1
fi
dnf install mysql -y
if [ $? -ne 0 ]; then
    echo "Installing MYSQL is failure...."
else
    echo "Installation of MYSQL is Success"
fi