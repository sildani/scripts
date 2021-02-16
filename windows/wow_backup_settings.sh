#!/bin/bash

# Assumes google drive is available in /d/google\ drive/

FILENAME=wow.zip
SOURCE_FILE=/tmp/$FILENAME
TARGET_FILE="/d/google drive/$FILENAME"

# echo -n "FILE="
# echo $SOURCE_FILE
# echo -n "TARGET_FILE="
# echo $TARGET_FILE

# remove previous archive if exists
if [ -f "$SOURCE_FILE" ]; then
  echo -n " > Removing previous archive file..."
  rm $SOURCE_FILE
  echo " DONE"
fi

# create the zip file using GNU zip (see https://github.com/bmatzelle/gow/wiki for the win32 binary of the GNU zip)
echo -n " > Creating archive..."
cd /c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_
zip -rq $SOURCE_FILE Interface WTF
echo " DONE"

# upload the zip file
echo -n " > Uploading archive..."
rm -f $TARGET_FILE
cp $SOURCE_FILE "$TARGET_FILE"
echo " DONE"

# clean up file
echo -n " > Cleanup ..."
rm $SOURCE_FILE
echo " DONE"
