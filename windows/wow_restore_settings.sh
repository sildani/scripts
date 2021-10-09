#!/bin/bash

# Assumes google drive is available in /g/My\ Drive/

WOW_DIR="/c/Program Files (x86)/World of Warcraft/_retail_"
CONFIG_FILE="$WOW_DIR/WTF/Config.wtf"
SOURCE_FILE="/g/My\ Drive/wow.zip"
TEMP_DIR="/tmp/addon_backup"

# echo -n "WOW_DIR=" ; echo $WOW_DIR
# echo -n "CONFIG_FILE=" ; echo $CONFIG_FILE
# echo -n "SOURCE_FILE=" ; echo $SOURCE_FILE
# echo -n "TEMP_DIR=" ; echo $TEMP_DIR

# setup the temp dir to work in
echo -n " > Creating the temp dir... "
if [ -d "$TEMP_DIR" ]; then
  rm -rf $TEMP_DIR
fi
mkdir $TEMP_DIR
echo "DONE"

# backup game settings
echo -n " > Backing up Config.wtf... "
cp "$CONFIG_FILE" $TEMP_DIR/
echo "DONE"

# back up current local settings
echo -n " > Backing up current local addon settings... "
mkdir $TEMP_DIR/local_backup
cp -r "$WOW_DIR/Interface" $TEMP_DIR/local_backup/
cp -r "$WOW_DIR/WTF" $TEMP_DIR/local_backup/
echo "DONE"

# get into the temp dir to get to work
cd $TEMP_DIR
echo -n " > Change dirs... "
echo `pwd`

# stage the backed up data
echo -n " > Staging the cloud back-up settings to restore... "
cp "$SOURCE_FILE" ./
unzip -q ./wow.zip
echo "DONE"

# move the files into place
echo -n " > Restoring the cloud back-up and original Config.wtf..."
rm -rf "$WOW_DIR/Interface"
rm -rf "$WOW_DIR/WTF"
cp -r ./Interface "$WOW_DIR/"
cp -r ./WTF "$WOW_DIR/"
cp ./Config.wtf "$CONFIG_FILE"
echo "DONE"

echo "" ; echo "JOB DONE!"
