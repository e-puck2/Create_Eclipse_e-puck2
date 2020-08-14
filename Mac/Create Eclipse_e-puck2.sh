#!/bin/bash

export PATH=`/usr/libexec/java_home -v 1.8`/bin:$PATH

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
echo Enter the path to the folder where you want 
echo to generate the Eclipse_e-puck2 folder and press [ENTER]

read installation_dir

echo
echo Enter the path to the Eclipse DMG file you want to use and press [ENTER]

read eclipse_path

echo
echo Enter the path to the arm-none-eabi toolchain tar file you want to use 
echo and press [ENTER]

read gcc_path
gcc_folder_name=`tar -tzf $gcc_path | head -1 | cut -f1 -d"/"`

echo
echo Creating Eclipse_e-puck2.app
cp -R $current_dir/Installation\ Stuff/ $installation_dir/Eclipse_e-puck2
if [ $? -ne 0 ]; then
    exit
fi
echo Eclipse_e-puck2.app created

echo
echo Copying Eclipse.app
hdiutil mount $eclipse_path
if [ $? -ne 0 ]; then
    exit
fi

cp -R /Volumes/Eclipse/eclipse.app $installation_dir/Eclipse_e-puck2/Eclipse_e-puck2.app/Contents/Eclipse_e-puck2/
if [ $? -ne 0 ]; then
    exit
fi

hdiutil eject "/Volumes/Eclipse"
if [ $? -ne 0 ]; then
    exit
fi
echo Eclipse.app copied

echo
echo Extracting arm-none-eabi
tar -zxf $gcc_path -C $installation_dir/Eclipse_e-puck2/Eclipse_e-puck2.app/Contents/Eclipse_e-puck2/Tools/
if [ $? -ne 0 ]; then
    exit
fi
echo arm-none-eabi extracted

echo
echo Copying EmbSysRegView plugin

cp -R $current_dir/Plugin\ Stuff/ $installation_dir/Eclipse_e-puck2/Eclipse_e-puck2.app/Contents/Eclipse_e-puck2/Eclipse.app/Contents/Eclipse/plugins/
if [ $? -ne 0 ]; then
    exit
fi
echo EmbSysRegView copied

echo
echo Installing the Hardware Debugging plugin
echo Please authorize the opening of Eclipse if asked

$installation_dir/Eclipse_e-puck2/Eclipse_e-puck2.app/Contents/Eclipse_e-puck2/eclipse.app/Contents/MacOS/eclipse \
-clean -purgeHistory \
-application org.eclipse.equinox.p2.director \
-noSplash \
-repository http://download.eclipse.org/tools/cdt/releases/9.11 \
-installIUs org.eclipse.cdt.debug.gdbjtag.feature.group
if [ $? -ne 0 ]; then
    exit
fi
echo Hardware Debugging plugin installed

echo
echo Unzipping Workspace

unzip -q $current_dir/Workspace.zip -d $installation_dir/Eclipse_e-puck2/Eclipse_e-puck2.app/Contents/Eclipse_e-puck2/
if [ $? -ne 0 ]; then
    exit
fi

rm -rf $installation_dir/Eclipse_e-puck2/Eclipse_e-puck2.app/Contents/Eclipse_e-puck2/__MACOSX
if [ $? -ne 0 ]; then
    exit
fi
echo Workspace unzipped

echo
echo Configuring the PATH to the arm-none-eabi folder given
sed -i "" '11 c\
export PATH=$dir/../Eclipse_e-puck2/Tools/'"$gcc_folder_name"'/bin:$PATH
' $installation_dir/Eclipse_e-puck2/Eclipse_e-puck2.app/Contents/MacOS/Eclipse_e-puck2
if [ $? -ne 0 ]; then
    exit
fi
echo
echo Finished