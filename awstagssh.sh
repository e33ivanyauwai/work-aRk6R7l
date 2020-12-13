#!/bin/bash

#aws ec2 describe-instances --filters 'Name=tag:Name,Values='$1 --output text --query 'Reservations[].Instances[].PublicIpAddress'
out=$(aws ec2 describe-instances --filters 'Name=tag:Name,Values='$1 --output text --query 'Reservations[].Instances[].PublicIpAddress'
)
if [[ $? != 0 ]]; then
    echo "Command failed."
elif [[ $out ]]; then
    ssh ec2-user@$out
else
    echo "Host not found."
fi
