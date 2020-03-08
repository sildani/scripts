#!/bin/bash

# This script removes the Location.dll file, which must be removed in order to get Hearthstone to work properly.

rm Games/battlenet/drive_c/Program\ Files\ \(x86\)/Hearthstone/Hearthstone_Data/Plugins/LocationAPI.dll

echo "LocationAPI.dll removed.

In addition, take the following steps to complete the fix:

1. Click “Wine registry”.
2. Navigate to HKEY_CURRENT_USER > Software > Wine > X11 Driver.
3. Right-click X11 Driver and add a new string “UseTakeFocus”.
4. Modify the value to “N”."
