#!/bin/bash

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo
echo Enter the path to the folder containing the Eclipse_Mobots folder

read installation_dir

echo
echo Creating the image
cp $current_dir/Eclipse_Mobots_Model.sparseimage $installation_dir/

hdiutil mount $installation_dir/Eclipse_Mobots_Model.sparseimage

cp -R $installation_dir/Eclipse_Mobots/Eclipse_Mobots.app /Volumes/Eclipse_Mobots
cp $installation_dir/Eclipse_Mobots/ReadMe.txt /Volumes/Eclipse_Mobots

hdiutil eject "/Volumes/Eclipse_Mobots"

echo
echo Compressing the image
hdiutil convert -format UDZO -o $installation_dir/Eclipse_Mobots.dmg $installation_dir/Eclipse_Mobots_Model.sparseimage

rm $installation_dir/Eclipse_Mobots_Model.sparseimage

