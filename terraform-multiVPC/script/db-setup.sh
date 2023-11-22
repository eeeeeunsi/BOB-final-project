#!/bin/bash

sudo yum install -y unzip git

# AWS CLI v2 설치
sudo yum remove awscli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -f awscliv2.zip
sudo mv /usr/local/bin/aws /usr/bin/aws


# MySQL 클라이언트 설치
if ! command -v mysql &> /dev/null; then
    sudo yum install -y mysql
else
    echo "MySQL 클라이언트는 이미 설치되어 있습니다."
fi
