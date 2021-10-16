#!/bin/bash

./config.sh --url $GITHUB_REPO --token $RUNNER_TOKEN --unattended --replace
./run.sh
