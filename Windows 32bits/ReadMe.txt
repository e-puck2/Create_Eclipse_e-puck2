This folder contains all the modifications to make to an Eclipse installation to prepare it for e-puck 2 programming. It is a comports everything except Eclipse
installation and arm-none-eabi toolchain.

Installation Stuff folder contains all the stuff to copy into a new Eclipse_Mobots folder

The executable "Eclipse_Mobots.exe" is made trough a Code::Blocks project named
« Launcher »
It simply executes the Eclipse_Mobots.bat script localized in 
Eclipse_Mobots -> eclipse

It is possible to simply use the .bat file instead of the .exe file 
but the .exe gives the possibility to have an embedded icon and everybody knows what to do with an .exe file.

Here is the directory structure to respect:

-Eclipse_Mobots		<- Eclipse Mobots main directory
--eclipse		<- Eclipse installation directory

---plugins		<- Folder made by Eclipse containing its plugins
---Eclipse_Mobots.bat	<- Script to launch Eclipse with customized arguments
--Tools			<- Folder containing gcc-none-aebi toolchain
--Workspace		<- Folder containing the Eclipse Parameters
--Eclipse_Mobots.exe	<- Executable to launch the Eclipse_Mobots.sh script
--ReadMe.txt		<- ReadMe containing the how to use for the final user



Steps to prepare Eclipse : 

1) 	Create a folder named Eclipse_Mobots

2)  	Download Eclipse IDE for C/C++ Developers archive version and unzip it into

	the new Eclipse_Mobots folder. You should obtain an eclipse folder.

3) 	Copy paste everything located in the installation Stuff folder to the new
 
	Eclipse_Mobots folder.
 Check replace if asked
4)	Download arm-none-eabi toolchain and unzip it into the Tools folder of the
 
	new Eclipse_Mobots folder.

5)	Edit the Eclipse_Mobots.bat script and verify if the paths are correct for
 
	your installation.

6)	Execute Eclipse_Mobots.exe and install thought the menu
 
	Help -> Install new software the plugin C/C++ GDB Hardware Debugging located

	in CDT Optional Features

6)	It’s done



Compress in zip file the folder Eclipse_Mobots, rename it and distribute it.

Note : If the Zip archive is done with Windows, it doesn't include some files. It works with WinRar