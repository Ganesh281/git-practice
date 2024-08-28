#!/bin/bash

USERID=$(id -u)
#echo "User ID is: $USERID"

if [ $USERID -ne 0 ]
then 
    echo "Please run this script with root privilege"
    exit 1
fi

dnf list installed git

if [$? -ne 0 ]
then 
    echo "git is not installed, going to install.."
    dnf install git -y
    if [ $? -ne 0 ]
    then
        echo "Git installation is not success.."
        exit 1
    else
        echo "Git installation is success"
    fi
else
    echo "git is already installed, nothing to do.."
fi    

