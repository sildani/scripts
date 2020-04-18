#!/bin/bash

# remove previous archive if exists
FILE=/tmp/wow.zip
if [ -f "$FILE" ]; then
  echo -n " > Removing previous archive file..."
  rm $FILE
  echo " DONE"
fi

# create the zip file
echo -n " > Creating archive..."
cd ~/Games/battlenet/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_
zip -rq $FILE Interface WTF
echo " DONE"

# upload the zip file
# default mode is to overrite the file
# logging not required because script already does it
# more info: https://github.com/andreafabrizi/Dropbox-Uploader
TARGET_FILE=/wow.zip
dropbox_uploader delete $TARGET_FILE
dropbox_uploader upload $FILE $TARGET_FILE

# clean up file
echo -n " > Cleanup ..."
rm $FILE
echo " DONE"
