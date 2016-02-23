Wercker step Deploy Google Play [![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://github.com/kagweb/wercker-step-deploy-googleplay/blob/master/LICENCE)
====

This is [wercker](http://wercker.com/) deploy step to upload Android app to Google Play.

## Usage

In the `wercker.yml` of your application use the following step definition:

```yaml
steps:
   - kagweb/deploy-googleplay:
     app_path: /PATH/TO/APP
	 key_path: /PATH/TO/KEY
```

To use this step, you need to set app_path and key_path.

## Author

[kagweb](https://github.com/kagweb)