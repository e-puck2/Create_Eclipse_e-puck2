#!/bin/bash

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo
echo Enter the path to the folder where you want 
echo to generate the Eclipse_Mobots folder and press [ENTER]

read installation_dir

echo
echo Enter the path to the Eclipse.app you want to use

read eclipse_path

echo
echo Enter the path to the arm-none-eabi toolchain folder you want to use

read gcc_path
gcc_folder_name=`basename "$gcc_path"`

echo
echo Creating Eclipse_Mobots.app
cp -R $current_dir/Installation\ Stuff/ $installation_dir/Eclipse_Mobots

echo Eclipse_Mobots.app created

echo
echo Copying Eclipse.app

cp -R $eclipse_path $installation_dir/Eclipse_Mobots/Eclipse_Mobots.app/Contents/Eclipse_Mobots/

echo Eclipse.app copied

echo
echo Copying arm-none-eabi
cp -R $gcc_path $installation_dir/Eclipse_Mobots/Eclipse_Mobots.app/Contents/Eclipse_Mobots/Tools/

echo arm-none-eabi copied

echo
echo Copying EmbSysRegView plugin

cp -R $current_dir/Plugin\ Stuff/ $installation_dir/Eclipse_Mobots/Eclipse_Mobots.app/Contents/Eclipse_Mobots/Eclipse.app/Contents/Eclipse/plugins/

echo EmbSysRegView copied

echo
echo Installing the Hardware Debugging plugin
echo Please authorize the opening of Ecipse if asked

open -W $installation_dir/Eclipse_Mobots/Eclipse_Mobots.app/Contents/Eclipse_Mobots/eclipse.app --args \
-clean -purgeHistory \
-application org.eclipse.equinox.p2.director \
-noSplash \
-repository http://download.eclipse.org/tools/cdt/releases/9.3 \
-installIUs org.eclipse.cdt.debug.gdbjtag.feature.group

echo Hardware Debugging plugin installed

echo
echo Unzipping Workspace

unzip -q $current_dir/Workspace.zip -d $installation_dir/Eclipse_Mobots/Eclipse_Mobots.app/Contents/Eclipse_Mobots/
rm -rf $installation_dir/Eclipse_Mobots/Eclipse_Mobots.app/Contents/Eclipse_Mobots/__MACOSX

echo Workspace unzipped
echo
echo

echo
echo Configuring the PATH to the arm-none-eabi folder given
sed -i "" '11 c\
export PATH=$dir/../Eclipse_Mobots/Tools/'"$gcc_folder_name"'/bin:$PATH
' $installation_dir/Eclipse_Mobots/Eclipse_Mobots.app/Contents/MacOS/Eclipse_Mobots

echo Finished