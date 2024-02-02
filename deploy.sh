#!/bin/bash

# Ensure we are in the correct directory
cd $DEPLOYMENT_PATH || exit

# Deploy files from the GitHub workspace to the server
scp -r $GITHUB_WORKSPACE/* .