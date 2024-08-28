#!/bin/bash

NUMBER=$1

if[ $NUMBER -gt ] #lt, gt, eq, -ne
then
    echo "Given number : $NUMBER is greater than 20"
else
    echo "Given number : $NUMBER is less than 20"
fi