#!/bin/bash

# backup Windows Config.wtf
cp /c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/WTF/Config.wtf /tmp/Config.wtf

# clear out current settings
echo -n " > Clearing out current settings... "
rm -rf /c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/Interface
rm -rf /c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/WTF
echo "DONE"

# download latest backed-up settings
# script has logging built-in
~/OneDrive/Documents/code/Dropbox-Uploader/dropbox_uploader.sh download /wow.zip /tmp/wow.zip

# unpack
echo -n " > Unpacking archive and moving into location... "
cd /tmp
unzip -q ./wow.zip
mv ./Interface /c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/
mv ./WTF /c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/
echo "DONE"

# restore Windows Config.wtf
cp /tmp/Config.wtf /c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/WTF/Config.wtf

# clean
echo -n " > Removing /tmp/wow.zip... "
rm ./wow.zip
echo "DONE"