#!/bin/bash

# echo "wow_restore_settings not yet implemented"

SOURCE_DIR=$(cd ~/Downloads; pwd)
SOURCE_FILE=$SOURCE_DIR/wow.zip

printf " [wow_restore_settings] > SOURCE_DIR=$SOURCE_DIR\n"
printf " [wow_restore_settings] > SOURCE_FILE=$SOURCE_FILE\n"

if [ -f "$SOURCE_FILE" ]; then
  printf " [wow_restore_settings] > Restoring settings from $SOURCE_FILE... "
  if [ -d /tmp/wow_restore_settings ]; then
    rm -rf /tmp/wow_restore_settings
  fi
  mkdir /tmp/wow_restore_settings
  cd /tmp/wow_restore_settings
  cp ~/Downloads/wow.zip .
  unzip -q wow.zip
  mkdir ./current_local_settings
  mv /Applications/World\ of\ Warcraft/_retail_/Interface ./current_local_settings/
  mv /Applications/World\ of\ Warcraft/_retail_/WTF ./current_local_settings
  cp -r ./Interface /Applications/World\ of\ Warcraft/_retail_
  cp -r ./WTF /Applications/World\ of\ Warcraft/_retail_
  cp ./current_local_settings/WTF/Config.wtf /Applications/World\ of\ Warcraft/_retail_/WTF/
  printf "DONE\n"
else
  printf " [wow_restore_settings] > $SOURCE_FILE is not found, exiting\n"
fi

