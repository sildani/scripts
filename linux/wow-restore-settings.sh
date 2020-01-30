#!/bin/bash

# Assumes Windows drive is mounted to /mnt/windows

# Backup Linux Config.wtf
cp ~/Games/battlenet/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/WTF/Config.wtf /tmp/Config.wtf

# remove existing files and copy windows files
rm -rf ~/Games/battlenet/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/Cache
cp -R /mnt/windows/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/Cache ~/Games/battlenet/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/
rm -rf ~/Games/battlenet/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/Interface
cp -R /mnt/windows/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/Interface ~/Games/battlenet/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/
rm -rf ~/Games/battlenet/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/WTF 
cp -R /mnt/windows/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/WTF ~/Games/battlenet/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/

# Restore Linux Config.wtf
cp /tmp/Config.wtf ~/Games/battlenet/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/WTF/Config.wtf