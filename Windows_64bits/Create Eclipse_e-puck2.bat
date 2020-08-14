@echo off
set current_dir=%cd%

echo.
echo.
echo WARNING All the paths you give must be correct
echo otherwise unpredictable behaviors could happen
echo Spaces in the paths are not allowed
echo.
echo You can drag and drop every file of folder in the terminal to 
echo give their path
echo .
echo Enter the path to the folder where you want 
echo to generate the Eclipse_e-puck2 folder and press [ENTER]

set /p installation_dir=

echo.
echo Enter the path to the eclipse zip file you want to use and press [ENTER]

set /p eclipse_path=

echo.
echo Enter the path to the arm-none-eabi toolchain zip file you want to use 
echo and press [ENTER]

set /p gcc_path=
for %%a in ("%gcc_path%") do set "gcc_folder_name=%%~na"

echo.
echo Extracting Eclipse

mkdir %installation_dir%\Eclipse_e-puck2
if %errorlevel% neq 0 (
pause
exit
)

%current_dir%\"Installation Stuff"\Tools\gnutools\bin\7za.exe x %eclipse_path% -o%installation_dir%\Eclipse_e-puck2
if %errorlevel% neq 0 (
pause
exit
)

echo Eclipse extracted

echo.
echo Copying Instalation stuff to Eclipse_e-puck2 folder
xcopy %current_dir%\"Installation Stuff" %installation_dir%\Eclipse_e-puck2 /s /e /q
if %errorlevel% neq 0 (
pause
exit
)
echo Installation stuff copied

echo.
echo Extracting arm-none-eabi
mkdir %installation_dir%\Eclipse_e-puck2\Tools\%gcc_folder_name%
if %errorlevel% neq 0 (
pause
exit
)
%current_dir%\"Installation Stuff"\Tools\gnutools\bin\7za.exe x %gcc_path% -o%installation_dir%\Eclipse_e-puck2\Tools\%gcc_folder_name%
if %errorlevel% neq 0 (
pause
exit
)
echo arm-none-eabi extracted

echo.
echo Installing the Hardware Debugging plugin
echo Please authorize the opening of Eclipse if asked

%installation_dir%/Eclipse_e-puck2/eclipse/eclipsec.exe ^
-clean -purgeHistory ^
-application org.eclipse.equinox.p2.director ^
-noSplash ^
-repository http://download.eclipse.org/tools/cdt/releases/9.3 ^
-installIUs org.eclipse.cdt.debug.gdbjtag.feature.group
if %errorlevel% neq 0 (
pause
exit
)
echo Hardware Debugging plugin installed

echo.
echo Unzipping Workspace

%current_dir%\"Installation Stuff"\Tools\gnutools\bin\7za.exe x %current_dir%\Workspace.zip -o%installation_dir%\Eclipse_e-puck2
if %errorlevel% neq 0 (
pause
exit
)
echo.
echo Workspace unzipped

echo.
echo Configuring the PATH to the arm-none-eabi folder given
echo \tools\%gcc_folder_name%\bin>%installation_dir%\Eclipse_e-puck2\eclipse\gcc_path.txt
if %errorlevel% neq 0 (
pause
exit
)
echo.
echo Finished

PAUSE