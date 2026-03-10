#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m]"
Y="\e[33m"
N="\e[0m]"

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2...$R is Failure $N"
        exit 1
    else
        echo -e "Intalling $2...$G is SUCCESS $N"   
    fi    
}


dnf list installed mysql
# Intall if not found
if [ $? -ne 0 ]; then 
    dnf install mysql -y 
    VALIDATE $? "MySQL"
else
    echo -e "MySql already exit ...$Y SKIPPING $N"
fi        

dnf list installed Nginx
if [ $? -ne 0 ]; then
    dnf install Nginx -y
    VALIDATE $? "Nginx"
else
    echo -e "Nginx already exit ...$Y SKIPPING $N"
fi

dnf list installed Python3 -y
if [ $? -ne 0 ]; then
    dnf install Python3 -y
    VALIDATE $?  "Python3"
else
    echo -e "Python3 already exit ...$Y SKIPPING $N"
fi    
