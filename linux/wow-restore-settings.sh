#!/bin/bash

# mount windows drive
~/bin/mount-windows.sh

# remove existing files and copy windows files
rm -rf ~/Games/battlenet/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/Interface
cp -R /mnt/windows/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/Interface ~/Games/battlenet/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/
rm -rf ~/Games/battlenet/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/WTF 
cp -R /mnt/windows/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/WTF ~/Games/battlenet/drive_c/Program\ Files\ \(x86\)/World\ of\ Warcraft/_retail_/
