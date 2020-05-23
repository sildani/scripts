#!/bin/bash

# backup game settings
cp ~/Games/battlenet/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/WTF/Config.wtf /tmp/Config.wtf

# clear out current settings
echo -n " > Clearing out current settings... "
rm -rf ~/Games/battlenet/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/Interface
rm -rf ~/Games/battlenet/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/WTF
echo "DONE"

# download the zip file
# see https://github.com/andreafabrizi/Dropbox-Uploader
dropbox_uploader download /wow.zip /tmp/wow.zip

# unpack
echo -n " > Unpacking archive and moving into location... "
cd /tmp
unzip -q ./wow.zip
mv ./Interface ~/Games/battlenet/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/
mv ./WTF ~/Games/battlenet/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/
echo "DONE"

# restore game settings
cp /tmp/Config.wtf ~/Games/battlenet/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/WTF/Config.wtf

# clean
echo -n " > Removing /tmp/wow.zip... "
rm /tmp/wow.zip
echo "DONE"
