#!/bin/bash

USERID=$(id -u)
#echo "User ID is: $USERID"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "$2 is...failed"
        exit 1
    else
        echo "$2 is...success"
    fi
}
CHECK_ROOT(){
if [ $USERID -ne 0 ]
then 
    echo "Please run this script with root privilege"
    exit 1
fi
}

CHECK_ROOT

dnf list installed git

if [$? -ne 0 ]
then 
    echo "git is not installed, going to install.."
    dnf install git -y
    VALIDATE $? "Installing Git"
else 
    echo "Git is already installed, noting to do.."    
fi

if [$? -ne 0 ]
then 
     echo "mysql is not installed, going to install.."
     dnf install mysql -y
     VALIDATE $? "Installing MySQL"
     
else
    echo "mysql is already installed, nothing to do.."
fi    