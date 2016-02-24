#!/bin/sh

# Environmental variables
SERVICE_ACCOUNT_EMAIL="$WERCKER_SERVICE_ACCOUNT_EMAIL"
KEY_FILE="$WERCKER_KEY_FILE"
PACKAGE_NAME="$WERCKER_PACKAGE_NAME"
APP_FILE="$WERCKER_APP_FILE"
TRACK="$WERCKER_TRACK"

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
python publisher.py SERVICE_ACCOUNT_EMAIL KEY_FILE PACKAGE_NAME APP_FILE TRACK
