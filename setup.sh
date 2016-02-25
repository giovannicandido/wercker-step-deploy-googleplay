#!/bin/bash

sudo apt-get update
sudo apt-get install -y build-essential libffi-dev python-dev python-openssl python-pip
echo "python version $(python --version) running"
echo "pip version $(pip --version) running"
sudo pip install --upgrade pyopenssl
sudo pip install --upgrade httplib2
sudo pip install --upgrade uritemplate
sudo pip install --upgrade oauth2client
sudo pip install --upgrade google-api-python-client
