#!/bin/bash
USERID = $(id -u)
echo "user id is:$USERID"

if [ $USERID -ne 0 ]
then
    echo "please provide root privileges"
    exit 1
fi

dnf list installed git

if [ $? -ne 0 ]
then
    echo "please install git first then ask"
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "git installation not successful..check it"
        exit 1
    else
        echo "git installation is success"
    fi
else 
    echo "git is already installed"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "please install mysql first then ask"
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "mysql installation not successful..check it"
        exit 1
    else
        echo "mysql installation is success"
    fi
else 
    echo "mysql is already installed"
fi
