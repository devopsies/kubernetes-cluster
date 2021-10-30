#!/bin/bash

cd /home/runner/actions-runner

sudo su runner -c "./config.sh --url $REPO_URL --token $RUNNER_TOKEN"

sudo ./svc.sh install runner
sudo ./svc.sh start
sudo ./svc.sh status
