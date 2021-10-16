#!/bin/bash

curl -o actions-runner-linux-x64-2.283.2.tar.gz -L https://github.com/actions/runner/releases/download/v2.283.2/actions-runner-linux-x64-2.283.2.tar.gz
echo "ef2b350068f7d581eb6840e3c399a42f9cb808f7ee9a0456f3ad97c84ccb2a9d  actions-runner-linux-x64-2.283.2.tar.gz" | shasum -a 256 -c
mv actions-runner-linux-x64-2.283.2.tar.gz actions-runner-linux-x64.tar.gz
sudo docker build -t github-runner --build-arg RUNNER_TOKEN=$RUNNER_TOKEN,GITHUB_REPO=$GITHUB_REPO .

