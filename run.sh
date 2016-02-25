#!/bin/bash

# Environmental variables
SERVICE_ACCOUNT_EMAIL="$WERCKER_DEPLOY_GOOGLEPLAY_SERVICE_ACCOUNT_EMAIL"
KEY_FILE="$WERCKER_DEPLOY_GOOGLEPLAY_KEY_FILE"
PACKAGE_NAME="$WERCKER_DEPLOY_GOOGLEPLAY_PACKAGE_NAME"
APP_FILE="$WERCKER_DEPLOY_GOOGLEPLAY_APP_FILE"
TRACK="$WERCKER_DEPLOY_GOOGLEPLAY_TRACK"

# Check and Set Default value
if [ -z "${SERVICE_ACCOUNT_EMAIL}" ]; then
    fail "Please set your service account email."
fi

if [ -z "${KEY_FILE}" ]; then
    fail "Please set your service key file's path."
fi

if [ -z "${PACKAGE_NAME}" ]; then
    fail "Please set your app's package name."
fi

if [ -z "${APP_FILE}" ]; then
    fail "Please set your app's file path."
fi

. $WERCKER_STEP_ROOT/setup.sh
python $WERCKER_STEP_ROOT/publisher.py $SERVICE_ACCOUNT_EMAIL $KEY_FILE $PACKAGE_NAME $APP_FILE $TRACK
