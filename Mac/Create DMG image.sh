#!/bin/bash

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo
echo
echo WARNING All the paths you give must be correct
echo otherwise unpredictable behaviors could happen
echo Spaces in the paths are not allowed
echo
echo You can drag and drop every file of folder in the terminal to 
echo give their path
echo
echo Enter the path to the folder containing the Eclipse_Mobots folder
echo and press [ENTER]

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
hdiutil convert -format UDZO -o $installation_dir/Eclipse_Mobots_Mac.dmg $installation_dir/Eclipse_Mobots_Model.sparseimage

rm $installation_dir/Eclipse_Mobots_Model.sparseimage

echo
echo Finished

