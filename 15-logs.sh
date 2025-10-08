#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[0m"

USERID=$(id -u)

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "Script starting excuted at $(date)"
if [ $USERID -ne 0 ]; then
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

dnf list installed mysql &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "mysql"
else
    echo -e "mysql already exist .....$Y SKIPPING...$N"
fi

dnf list installed nginx &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e "nginx already exist ....$Y SKIPPING...$N"
fi

dnf list installed nodejs &>>$LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nodejs -y &>>$LOG_FILE
    VALIDATE $? "nodejs"
else
    echo -e "nodejs already exists ....$Y SKIPPING...$N"
fi