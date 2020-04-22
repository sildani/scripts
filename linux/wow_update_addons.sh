#!/bin/bash

read -p "
This script will look for addon zip file in /tmp/blizzard to install.

Press any key to continue, or hit CTRL-C to exit
"

ali_script_dir="/tmp/blizzard"
ali_script_dir_listing=`ls $ali_script_dir`
ali_addon_zip_files=( $ali_script_dir_listing )
ali_wow_addons_dir="/home/daniel/Games/battlenet/drive_c/Program Files (x86)/World of Warcraft/_retail_/Interface/AddOns"

echo "\$ali_script_dir:
$ali_script_dir
"
echo "\$ali_script_dir_listing:
$ali_script_dir_listing
"

echo "\$ali_addon_zip_files:
$ali_addon_zip_files
"

echo "\$ali_wow_addons_dir:
$ali_wow_addons_dir
"

mkdir $ali_script_dir/addons
mkdir $ali_script_dir/addons-old
cd $ali_script_dir/addons

for ali_addon_zip_file in ${ali_addon_zip_files[*]}; do

    unzip ../$ali_addon_zip_file && echo ""
    ali_addons_dirs_listing=`ls`
    ali_addon_dirs=( $ali_addons_dirs_listing )

    for ali_addon_dir in ${ali_addon_dirs[*]}; do

        echo "\$ali_addon_dir:"
        echo $ali_addon_dir
        echo ""

        # backup addon currently installed
        mv -v "$ali_wow_addons_dir/$ali_addon_dir" ../addons-old/
        echo ""

        # install new one
        mv -v ./$ali_addon_dir "$ali_wow_addons_dir/"
        echo ""

    done

    mv -v ../$ali_addon_zip_file ../addons-old/
    echo ""

done

echo "DONE
"
