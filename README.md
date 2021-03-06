Wercker step Deploy Google Play [![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/giovannicandido/wercker-step-deploy-googleplay/blob/master/LICENCE)
====

[![wercker status](https://app.wercker.com/status/af7c2d6f66355000b001475b962fa994/m "wercker status")](https://app.wercker.com/project/bykey/af7c2d6f66355000b001475b962fa994)
This is [wercker](http://wercker.com/) deploy step for upload Android app to Google Play.

## Usage

In the `wercker.yml` of your application use the following step definition:

```yaml
box:
  id: atende/google-api-python
  cmd: /bin/ash
steps:
  - anectinc/deploy-googleplay:
      service_account_email: $SERVICE_ACCOUNT_EMAIL
      key_file: /PATH/TO/KEY
      key_pass: optional_password_for_key_file
      package_name: PACKAGE_NAME
      app_file: /PATH/TO/APK
      track: TRACK
```

To use this step, you need to set $SERVICE_ACCOUNT_EMAIL, key_file, package_name and app_file.

We recommend store your *key_pass* as env variable.

## Authors

[anectinc](https://github.com/anectinc)
[giovannicandido](https://github.com/giovannicandido)
