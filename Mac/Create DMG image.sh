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
echo Enter the path to the folder containing the Eclipse_e-puck2 folder
echo and press [ENTER]

read installation_dir

echo
echo Creating the image
cp $current_dir/Eclipse_e-puck2_Model.sparseimage $installation_dir/

hdiutil mount $installation_dir/Eclipse_e-puck2_Model.sparseimage

cp -R $installation_dir/Eclipse_e-puck2/Eclipse_e-puck2.app /Volumes/Eclipse_e-puck2
cp $installation_dir/Eclipse_e-puck2/ReadMe.txt /Volumes/Eclipse_e-puck2

hdiutil eject "/Volumes/Eclipse_e-puck2"

echo
echo Compressing the image
hdiutil convert -format UDZO -o $installation_dir/Eclipse_e-puck2_Mac.dmg $installation_dir/Eclipse_e-puck2_Model.sparseimage

rm $installation_dir/Eclipse_e-puck2_Model.sparseimage

echo
echo Finished

