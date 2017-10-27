@echo off
set PATH=%cd%\tools\gnutools\bin;%PATH%
set PATH=%cd%\tools\gcc-arm-none-eabi-5_4-2016q3\arm-none-eabi\bin;%PATH%
set PATH=%cd%\tools\gcc-arm-none-eabi-5_4-2016q3\bin;%PATH%

start eclipse\eclipse.exe -data Workspace