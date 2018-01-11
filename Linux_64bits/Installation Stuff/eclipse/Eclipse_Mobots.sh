#!/bin/bash

#do not change the lines numbers without changing them in the Create Eclipse_Mobots.sh script
#because it is used to actualise the line with arm-none-eabi

dir=$PWD

gvfs-set-attribute -t string $dir/Eclipse_Mobots metadata::custom-icon file:///$dir/eclipse/icon.xpm

#below is the line changed by the script
export PATH=$dir/Tools/gcc-arm-none-eabi-5_4-2016q3/bin:$PATH

export PATH=/usr/lib/jvm/java-8-openjdk-i386/bin:$PATH
export PATH=/usr/lib/jvm/java-8-openjdk/bin:$PATH

eclipse/eclipse -data Workspace
