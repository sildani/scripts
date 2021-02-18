#!/bin/bash

# echo "wow_restore_settings not yet implemented"

SOURCE_DIR=$(cd ~/Downloads; pwd)
SOURCE_FILE=$SOURCE_DIR/wow.zip
TEMP_DIR=/tmp/wow_restore_settings
STAGED_SOURCE_FILE=$TEMP_DIR/wow.zip
WOW_DIR="/Applications/World of Warcraft/_retail_"

printf " [wow_restore_settings] > SOURCE_DIR=$SOURCE_DIR\n"
printf " [wow_restore_settings] > SOURCE_FILE=$SOURCE_FILE\n"
printf " [wow_restore_settings] > TEMP_DIR=$TEMP_DIR\n"
printf " [wow_restore_settings] > STAGED_SOURCE_FILE=$STAGED_SOURCE_FILE\n"
printf " [wow_restore_settings] > WOW_DIR=$WOW_DIR\n"


if [ -f "$SOURCE_FILE" ]; then
  printf " [wow_restore_settings] > Restoring settings from $SOURCE_FILE... "
  if [ -d $TEMP_DIR ]; then
    rm -rf $TEMP_DIR
  fi
  mkdir $TEMP_DIR
  cd $TEMP_DIR
  cp $SOURCE_FILE $STAGED_SOURCE_FILE
  unzip -q $STAGED_SOURCE_FILE
  mkdir ./current_local_settings
  mv "$WOW_DIR/Interface" ./current_local_settings/
  mv "$WOW_DIR/WTF" ./current_local_settings/
  cp -r ./Interface "$WOW_DIR/"
  cp -r ./WTF "$WOW_DIR/"
  cp ./current_local_settings/WTF/Config.wtf "$WOW_DIR/WTF/"
  printf "DONE\n"
else
  printf " [wow_restore_settings] > $SOURCE_FILE is not found, exiting\n"
fi

