#!/usr/bin/python
#
# Copyright 2014 Google Inc. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the 'License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


import argparse
import sys
from googleapiclient.discovery import build
import httplib2
from oauth2client import client
from oauth2client.service_account import ServiceAccountCredentials
import mimetypes

# Declare command-line flags.
argparser = argparse.ArgumentParser(description='Upload Android app to Google Play.')
argparser.add_argument('service_account_email',
                       help='EXAMPLE@developer.gserviceaccount.com')
argparser.add_argument('key_file',
                       help='The path to the Key file.')
argparser.add_argument('package_name',
                       help='The package name. Example: com.android.sample')
argparser.add_argument('apk_file',
                       help='The path to the APK file to upload.')
argparser.add_argument('track',
                       nargs='?',
                       default='alpha',
                       help='Can be \'alpha\', \'beta\', \'production\' or \'rollout\'')
argparser.add_argument('key_pass',
                       nargs="?",
                       help='Password to key file.')

def main(argv):
  flags = argparser.parse_args()

  # Process flags and read their values.
  service_account_email = flags.service_account_email
  key_file = flags.key_file
  key_pass = flags.key_pass
  package_name = flags.package_name
  apk_file = flags.apk_file
  track = flags.track

  print 'service_account_email: %s' % service_account_email
  print 'key_file: %s' % key_file
  print 'package_name: %s' % package_name
  print 'apk_file: %s' % apk_file
  print 'track: %s' % track
  print 'key_pass: %s' % key_pass

  # apk mimetype
  mimetypes.add_type('application/vnd.android.package-archive', '.apk')

  credentials = ServiceAccountCredentials.from_p12_keyfile(
    service_account_email,
    key_file,
    key_pass,
    scopes='https://www.googleapis.com/auth/androidpublisher')
  http = httplib2.Http()
  http = credentials.authorize(http)

  service = build('androidpublisher', 'v2', http=http)


  try:
    edit_request = service.edits().insert(body={}, packageName=package_name)
    result = edit_request.execute()
    edit_id = result['id']

    apk_response = service.edits().apks().upload(
      editId=edit_id,
      packageName=package_name,
      media_body=apk_file).execute()

    print 'Version code %d has been uploaded' % apk_response['versionCode']

    track_response = service.edits().tracks().update(
      editId=edit_id,
      track=track,
      packageName=package_name,
      body={u'versionCodes': [apk_response['versionCode']]}).execute()

    print 'Track %s is set for version code(s) %s' % (
      track_response['track'], str(track_response['versionCodes']))

    commit_request = service.edits().commit(
      editId=edit_id, packageName=package_name).execute()

    print 'Edit "%s" has been committed' % (commit_request['id'])

  except client.AccessTokenRefreshError:
    print ('The credentials have been revoked or expired, please re-run the '
           'application to re-authorize')

if __name__ == '__main__':
  main(sys.argv)
