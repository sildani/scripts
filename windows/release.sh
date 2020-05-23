#!/bin/bash

# Windows doesn't handle symlinks properly, so to release this code, we will copy to a dir on path (/usr/local/bin)

SCRIPTS_HOME=~/.scripts/windows
INSTALL_TARGET=/usr/local/bin

cp $SCRIPTS_HOME/wow_backup_settings.sh $INSTALL_TARGET/wow_backup_settings
cp $SCRIPTS_HOME/wow_restore_settings.sh $INSTALL_TARGET/wow_restore_settings
