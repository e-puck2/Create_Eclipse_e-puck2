#!/bin/bash

dir=$PWD

gvfs-set-attribute -t string $dir/Eclipse_Mobots metadata::custom-icon file:///$dir/eclipse/icon.xpm

export PATH=$dir/Tools/gcc-arm-none-eabi-5_4-2016q3/bin:$PATH
export PATH=/usr/lib/jvm/java-8-openjdk-i386/bin:$PATH

eclipse/eclipse -data Workspace
