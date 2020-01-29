#!/bin/bash

# remove previous archive if exists
echo -n " > Removing archive file if exists..."
FILE=/tmp/wow.zip
if [ -f "$FILE" ]; then
  rm $FILE
fi
echo " DONE"

# create the zip file
echo -n " > Creating archive..."
cd Games/battlenet/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_
zip -rq $FILE Interface WTF
echo " DONE"

# upload the zip file
# default mode is to overrite the file
# logging not required because script already does it
TARGET_FILE=/wow.zip
~/bin/dropbox_uploader.sh delete $TARGET_FILE
~/bin/dropbox_uploader.sh upload $FILE $TARGET_FILE

# clean up file
echo -n " > Cleanup ..."
rm $FILE
echo " DONE"
