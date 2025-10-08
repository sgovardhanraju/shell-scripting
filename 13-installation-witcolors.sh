#!/bin/bash

# 31m-RED, 32m-GREEN, 33m-YELLO, 0m-WHITE, 37m-WHITE(default)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[0m"

USERID=$(id -u)

if [ $? -ne 0 ]; then
    echo "ERROR::Please run the script with root privileges"
    exit 1
fi

VALIDATE () { # functions receive inputs through args just like shell script args
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2..... $R is failure $N"
        exit 1
    else
        echo -e "Installing $2..... $G is SUCCESS $N"
    fi

}

dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo -e "mysql already exist .....$Y SKIPPING...$N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "nginx already exist ....$Y SKIPPING...$N"
fi

dnf list installed nodejs
if [ $? -ne 0 ]; then
    dnf install nodejs -y
    VALIDATE $? "nodejs"
else
    echo -e "nodejs already exists ....$Y SKIPPING...$N"
fi