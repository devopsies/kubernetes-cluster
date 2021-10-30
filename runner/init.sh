#!/bin/bash

# Installing all required packages
apt-get update
apt-get install -y curl perl gnupg software-properties-common

# Installing all required Github runner resources
mkdir -p /home/runner/actions-runner
cd /home/runner/actions-runner
curl -o actions-runner-linux-x64-2.283.3.tar.gz -L https://github.com/actions/runner/releases/download/v2.283.3/actions-runner-linux-x64-2.283.3.tar.gz
echo "09aa49b96a8cbe75878dfcdc4f6d313e430d9f92b1f4625116b117a21caaba89  actions-runner-linux-x64-2.283.3.tar.gz" | shasum -a 256 -c
tar xzf ./actions-runner-linux-x64-2.283.3.tar.gz
useradd runner
chown -R runner:runner /home/runner

# Installing Terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
apt-get install -y terraform

