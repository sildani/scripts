#!/bin/bash

# 2. run wow-backup-settings.sh
# 3. tar up a backup file (prune Downloads dir first) and upload to Google Drive:
#      ~ > tar czvf backup_$(date +%Y-%m-%d-%H%M).tar.gz ./Downloads ./.config/vivaldi ./.ssh

# backup wow settings
echo "
Backing up WoW settings
"
wow-backup-settings

# create a backup file that contains certain files
# do this from the home directory
cd ~/
backup_filename=/tmp/backup_$(date +%Y-%m-%d-%H%M).tar.gz
tar czvf $backup_filename ./Documents ./.config/vivaldi ./.ssh
echo "
$backup_filename created
"