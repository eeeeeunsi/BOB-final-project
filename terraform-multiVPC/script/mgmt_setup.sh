#!/bin/bash

sudo yum install -y unzip git

# AWS CLI v2 설치
sudo yum remove awscli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -f awscliv2.zip
sudo mv /usr/local/bin/aws /usr/bin/aws

# kubectl 설치
if ! command -v kubectl &> /dev/null; then
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x kubectl && \
    sudo mv kubectl /usr/bin/
else
    echo "kubectl은 이미 설치되어 있습니다."
fi

# eksctl 설치
if ! command -v eksctl &> /dev/null; then
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp && \
    sudo mv /tmp/eksctl /usr/bin/
else
    echo "eksctl은 이미 설치되어 있습니다."
fi

# Helm 설치
if ! command -v helm &> /dev/null; then
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh && \
    rm -f get_helm.sh
else
    echo "Helm은 이미 설치되어 있습니다."
fi

# Docker 설치
if ! command -v docker &> /dev/null; then
    sudo yum install -y docker && \
    sudo systemctl start docker && \
    sudo systemctl enable docker
else
    echo "Docker는 이미 설치되어 있습니다."
fi

# ec2-user를 Docker 그룹에 추가
sudo usermod -aG docker ec2-user
echo "ec2-user를 Docker 그룹에 추가했습니다."

# k9s 설치
mkdir k9s; cd k9s
wget https://github.com/derailed/k9s/releases/download/v0.26.7/k9s_Linux_x86_64.tar.gz
tar zxvf k9s_Linux_x86_64.tar.gz
sudo mv k9s /usr/local/bin/k9s