#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
    exit 1 #failure oother than 0
fi

dnf install  mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Intallating MYSQL is failure"
    exit 1
 else
    echo "Intalling MYSQL is SUCCESS"   
fi    