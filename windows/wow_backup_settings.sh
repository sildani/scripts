#!/bin/bash

FILENAME=wow.zip
FILE=/tmp/$FILENAME

# remove previous archive if exists
if [ -f "$FILE" ]; then
  echo -n " > Removing previous archive file..."
  rm $FILE
  echo " DONE"
fi

# create the zip file using GNU zip (see https://github.com/bmatzelle/gow/wiki for the win32 binary of the GNU zip)
echo -n " > Creating archive..."
cd /c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_
zip -rq $FILE Interface WTF
echo " DONE"

# upload the zip file
# see https://github.com/andreafabrizi/Dropbox-Uploader
dropbox_uploader delete $FILENAME
dropbox_uploader upload $FILE $FILENAME

# clean up file
echo -n " > Cleanup ..."
rm $FILE
echo " DONE"
