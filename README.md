Wercker step Deploy Google Play [![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/kagweb/wercker-step-deploy-googleplay/blob/master/LICENCE)
====

[![wercker status](https://app.wercker.com/status/e1c4b63dddce4ac791cb4c7bc9c1584b/m "wercker status")](https://app.wercker.com/project/bykey/e1c4b63dddce4ac791cb4c7bc9c1584b)

This is [wercker](http://wercker.com/) deploy step for upload Android app to Google Play.

## Usage

In the `wercker.yml` of your application use the following step definition:

```yaml
box: atende/google-api-python
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

We recommend store your key_pass as env variable.

## Author

[anectinc](https://github.com/anectinc)
