#!/bin/bash

sudo apt-get update
sudo apt-get install -y build-essential
sudo apt-get install -y libiffi-dev
sudo apt-get install -y python2.7
sudo apt-get install -y python-pip
echo "python version $(python --version) running"
echo "pip version $(pip --version) running"
sudo pip install --upgrade pyopenssl
sudo pip install --upgrade oauth2client
sudo pip install --upgrade google-api-python-client
