#!/bin/bash
export PATH=/usr/lib/jvm/java-8-openjdk-i386/bin:$PATH
export PATH=/usr/lib/jvm/java-8-openjdk/bin:$PATH

current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $current_dir

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
echo to generate the Eclipse_Mobots folder and press [ENTER]

read installation_dir
installation_dir=$(echo $installation_dir | sed "s/'//g")

echo
echo Enter the path to the eclipse folder you want to use and press [ENTER]

read eclipse_path
eclipse_path=$(echo $eclipse_path | sed "s/'//g")

echo
echo Enter the path to the arm-none-eabi toolchain folder you want to use
echo and press [ENTER]

read gcc_path
gcc_path=$(echo $gcc_path | sed "s/'//g")
gcc_folder_name=`basename "$gcc_path"`

echo
echo Copying Eclipse

mkdir $installation_dir/Eclipse_Mobots
if [ $? -ne 0 ]; then
    exit
fi

cp -R $eclipse_path $installation_dir/Eclipse_Mobots/
if [ $? -ne 0 ]; then
    exit
fi

echo Eclipse copied

echo
echo Copying Instalation stuff to Eclipse_Mobots folder
cp -R $current_dir/Installation\ Stuff/. $installation_dir/Eclipse_Mobots/
if [ $? -ne 0 ]; then
    exit
fi

echo Installation stuff copied

echo
echo Copying arm-none-eabi
cp -R $gcc_path $installation_dir/Eclipse_Mobots/Tools/
if [ $? -ne 0 ]; then
    exit
fi

echo arm-none-eabi copied

echo
echo Installing the Hardware Debugging plugin
echo Please authorize the opening of Ecipse if asked

$installation_dir/Eclipse_Mobots/eclipse/eclipse \
-clean -purgeHistory \
-application org.eclipse.equinox.p2.director \
-noSplash \
-repository http://download.eclipse.org/tools/cdt/releases/9.3 \
-installIUs org.eclipse.cdt.debug.gdbjtag.feature.group
if [ $? -ne 0 ]; then
    exit
fi

echo Hardware Debugging plugin installed

echo
echo Unzipping Workspace

unzip -q $current_dir/Workspace.zip -d $installation_dir/Eclipse_Mobots/
if [ $? -ne 0 ]; then
    exit
fi

echo Workspace unzipped

echo
echo Configuring the PATH to the arm-none-eabi folder given
sed -i '11 c\
export PATH=$dir/Tools/'"$gcc_folder_name"'/bin:$PATH
' $installation_dir/Eclipse_Mobots/eclipse/Eclipse_Mobots.sh
if [ $? -ne 0 ]; then
    exit
fi

echo Finished
