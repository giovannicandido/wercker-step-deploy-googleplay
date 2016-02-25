#!/bin/bash

sudo apt-get update
sudo apt-get install -y build-essential libffi-dev python-dev python-pip
echo "python version $(python --version) running"
echo "pip version $(pip --version) running"
sudo pip install --upgrade pyopenssl oauth2client google-api-python-client
