@echo off
set current_dir=%~dp0

rmdir /s /q c:\"Program files"\Eclipse_e-puck2\Workspace

%current_dir%\7za.exe x %current_dir%\Workspace.zip -o%current_dir%\extracted
if %errorlevel% neq 0 (
pause
exit
)

mkdir c:\"Program files"\Eclipse_e-puck2\Workspace
if %errorlevel% neq 0 (
pause
exit
)


xcopy %current_dir%\extracted\Workspace c:\"Program Files"\Eclipse_e-puck2\Workspace /s /e /q /h
if %errorlevel% neq 0 (
pause
exit
)

rmdir /s /q %current_dir%\extracted
if %errorlevel% neq 0 (
pause
exit
)

echo Eclipse updated successfully

PAUSE
cd %current_dir%\..\..

rmdir /s /q update_Eclipse_e-puck2
