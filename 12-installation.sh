#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Please run this script with root privelege"
fi

dnf insatll mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Intallating MYSQL is failure"
 else
    echo "Intalling MYSQL is SUCCESS"   