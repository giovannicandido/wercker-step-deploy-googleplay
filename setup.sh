#!/bin/bash

apt-get update
apt-get install -y python2.7
apt-get install -y python-pip
echo "python version $(python --version) running"
echo "pip version $(pip --version) running"
pip install --upgrade pyopenssl
pip install --upgrade oauth2client
pip install --upgrade google-api-python-client
