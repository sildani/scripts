#!/bin/bash

# Mount Windows drive in read-only mode to prevent data corruption. Edit for the appropriate device for you. Requires sudo access.

FILE=/mnt/windows
if [ ! -f "$FILE" ]; then
  sudo mkdir -p $FILE
fi
sudo mount -o ro /dev/nvme0n1p4 $FILE