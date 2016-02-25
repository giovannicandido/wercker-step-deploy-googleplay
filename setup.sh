#!/bin/bash

apt-get update
apt-get install -y python2.7
apt-get install -y python-pip
echo "python version $(python --version) running"
echo "pip version $(pip --version) running"
pip install pyopenssl
pip install oauth2client
pip install google-api-python-client
