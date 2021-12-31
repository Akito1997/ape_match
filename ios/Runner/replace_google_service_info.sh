#!/bin/sh

#  replace_google_service_info.sh
#  Runner
#
#  Created by 田中　玲桐 on 2021/12/11.
#  

if [ "${CONFIGURATION}" = "Debug" ]  ; then
  cp $PRODUCT_NAME/Firebase/GoogleService-Info-dev.plist $PRODUCT_NAME/GoogleService-Info.plist
  echo "Development GoogleService-Info copied."
elif [ "${CONFIGURATION}" = "Release" ] ; then
  cp $PRODUCT_NAME/Firebase/GoogleService-Info-release.plist $PRODUCT_NAME/GoogleService-Info.plist
  echo "Release GoogleService-Info copied."
else
  echo "configuration didn't match to Development."
  exit 1
fi
