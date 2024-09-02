#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOGFILE="$LOGS_FOLDER/$SCRIPTNAME/$TIMESTAMP.log"

mkdir -p $LOGS_FOLDER

USERID=$(id -u)
#echo "User ID is: $USERID"

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run this script with root privileges $N" | tee -a $LOGFILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 is...$R FAILED $N" | tee -a $LOGFILE
        exit 1
    else
        echo -e "$2 is...$G SUCCESS $N" | tee -a $LOGFILE
    fi
}

# USAGE(){
#     echo -e "$R USAGE:: $N sudo sh redirectors "
# }

for package in $@
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo " $Y $package is not installed,going to install it $N" | tee -a $LOGFILE
        dnf install $package -y
        VALIDATE $? " $Y INSTALLING $package $N" | tee -a $LOGFILE
    else
        echo "$G $package already installed $N" | tee -a $LOGFILE
    fi
done
