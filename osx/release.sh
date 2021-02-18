#!/bin/bash

INSTALL_TARGET="/usr/local/bin"

# printf " > INSTALL_TARGET=$INSTALL_TARGET\n"

if [ -f ./wow_backup_settings.sh ]; then
  printf " [release] > Releasing wow_backup_settings... "
  cp ./wow_backup_settings.sh $INSTALL_TARGET/wow_backup_settings
  printf "DONE\n"
fi

if [ -f ./wow_restore_settings.sh ]; then
  printf " [release] > Releasing wow_restore_settings... "
  cp ./wow_restore_settings.sh $INSTALL_TARGET/wow_restore_settings
  printf "DONE\n"
fi
