Wercker step Deploy Google Play [![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/kagweb/wercker-step-deploy-googleplay/blob/master/LICENCE)
====

This is [wercker](http://wercker.com/) deploy step for upload Android app to Google Play.

## Usage

In the `wercker.yml` of your application use the following step definition:

```yaml
steps:
   - anectinc/deploy-googleplay:
     service_account_email: $SERVICE_ACCOUNT_EMAIL
     key_file: /PATH/TO/KEY
     package_name: PACKAGE_NAME
     app_file: /PATH/TO/APK
     track: TRACK
```

To use this step, you need to set $SERVICE_ACCOUNT_EMAIL, key_file, package_name and app_file.

## Author

[anectinc](https://github.com/anectinc)
