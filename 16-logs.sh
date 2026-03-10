#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FLODER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -fa )
LOG_FILE="$LOGS_FLODER/$SCRIPT_NAME"

mkdir -p $LOGS_FLODER
echo "Script Started executed at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]; then 
    echo "Please run this script with Root Privelege"
    exit 1
fi


VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2...$R is Failure $N" | tee -a $LOG_FILE
        exit 1
    else
        echo -e "Intalling $2...$G is SUCCESS $N"  | tee -a $LOG_FILE 
    fi    
}


dnf list installed mysql
# Intall if not found
if [ $? -ne 0 ]; then 
    dnf install mysql -y 
    VALIDATE $? "MySQL"
else
    echo -e "MySql already exit ...$Y SKIPPING $N" | tee -a $LOG_FILE 
fi        

dnf list installed Nginx
if [ $? -ne 0 ]; then
    dnf install Nginx -y
    VALIDATE $? "Nginx"
else
    echo -e "Nginx already exit ...$Y SKIPPING $N" | tee -a $LOG_FILE 
fi

dnf list installed Python3 -y
if [ $? -ne 0 ]; then
    dnf install Python3 -y
    VALIDATE $?  "Python3"
else
    echo -e "Python3 already exit ...$Y SKIPPING $N" | tee -a $LOG_FILE 
fi    
