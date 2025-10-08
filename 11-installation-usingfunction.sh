#!/bin/bash

USERID=$(id -u)

if [ $? -ne 0 ]; then
    echo "ERROR::Please run the script with root privileges"
    exit 1
fi

VALIDATE () { # functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo "ERROR:: Installing $2 is failure"
        exit 1
    else
        echo "Installing $2 is SUCCESS"
    fi

}

dnf install mysql -y
VALIDATE $? "mysql"

dnf install nodejs -y
VALIDATE $? "nginx"

dnf install nginx -y
VALIDATE $? "nodejs"