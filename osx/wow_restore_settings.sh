#!/bin/bash

while getopts ":fvh" opt; do
  case ${opt} in
    f )
      FULL="true"
      ;;
    v )
      VERBOSE="true"
      ;;
    h )
      printf " [wow_restore_settings] Usage:\n"
      printf " [wow_restore_settings]   wow_restore_settings       Restores AddOns only\n"
      printf " [wow_restore_settings]   wow_restore_settings -f    Restores both AddOns and Settings\n"
      printf " [wow_restore_settings]   wow_restore_settings -v    Verbose output\n"
      printf " [wow_restore_settings]   wow_restore_settings -h    Displays this usage message\n"
      exit
      ;;
  esac
done
shift $((OPTIND -1))

SOURCE_DIR=$(cd ~/Downloads; pwd)
SOURCE_FILE=$SOURCE_DIR/wow.zip
TEMP_DIR=/tmp/wow_restore_settings
STAGED_SOURCE_FILE=$TEMP_DIR/wow.zip
WOW_DIR="/Applications/World of Warcraft/_retail_"

if [[ $VERBOSE == "true" ]]; then
  printf " [wow_restore_settings] SOURCE_DIR=$SOURCE_DIR\n"
  printf " [wow_restore_settings] SOURCE_FILE=$SOURCE_FILE\n"
  printf " [wow_restore_settings] TEMP_DIR=$TEMP_DIR\n"
  printf " [wow_restore_settings] STAGED_SOURCE_FILE=$STAGED_SOURCE_FILE\n"
  printf " [wow_restore_settings] WOW_DIR=$WOW_DIR\n"
  printf " [wow_restore_settings] FULL=$FULL\n"
  printf " [wow_restore_settings] VERBOSE=$VERBOSE\n"
fi

if [[ $FULL == "true" ]]; then
  printf " [wow_restore_settings] Restoring AddOns and Settings\n"
else
  printf " [wow_restore_settings] Restoring AddOns only\n"
fi

if [ -f "$SOURCE_FILE" ]; then
  printf " [wow_restore_settings] Restoring settings from $SOURCE_FILE... "
  
  if [ -d $TEMP_DIR ]; then
    rm -rf $TEMP_DIR
  fi
  mkdir $TEMP_DIR
  cd $TEMP_DIR
  
  cp $SOURCE_FILE $STAGED_SOURCE_FILE
  unzip -q $STAGED_SOURCE_FILE
  mkdir ./current_local_settings

  mv "$WOW_DIR/Interface" ./current_local_settings/
  cp -r ./Interface "$WOW_DIR/"

  if [[ $FULL == "true" ]]; then
    mv "$WOW_DIR/WTF" ./current_local_settings/
    cp -r ./WTF "$WOW_DIR/"
    cp ./current_local_settings/WTF/Config.wtf "$WOW_DIR/WTF/"
  fi

  printf "DONE\n"
else
  printf " [wow_restore_settings] $SOURCE_FILE is not found, exiting\n"
fi
