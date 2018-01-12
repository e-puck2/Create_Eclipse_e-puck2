This folder contains all the modifications to prepare an Eclipse installation for e-puck 2 programming. 
It contains everything except Eclipse 
installation and arm-none-eabi toolchain.



-"Installation Stuff" folder contains all the stuff to copy into a new Eclipse_e-puck2 folder


-"Workspace.zip" contains the preconfigured workspace for Eclipse
-"Create Eclipse_e-puck2.bat" is a script which automates the steps to create Eclipse_e-puck2

The executable "Eclipse_e-puck2.exe" is made trough a Code::Blocks project named
« Launcher »
It simply executes the Eclipse_e-puck2.bat script localized in 
Eclipse_e-puck2 -> eclipse

It is possible to simply use the .bat file instead of the .exe file 
but the .exe gives the possibility to have an embedded icon and everybody knows what to do with an .exe file.

Here is the directory structure to respect:

-Eclipse_e-puck2		<- Eclipse Mobots main directory
--eclipse		<- Eclipse installation directory

---plugins		<- Folder made by Eclipse containing its plugins
---Eclipse_e-puck2.bat	<- Script to launch Eclipse with customized arguments
---gcc_path.txt		<- Text file containing the path to the gcc folder
--Tools			<- Folder containing gcc-none-aebi toolchain
--Workspace		<- Folder containing the Eclipse Parameters
--Eclipse_e-puck2.exe	<- Executable to launch the Eclipse_e-puck2.sh script
--ReadMe.txt		<- ReadMe containing the how to use for the final user



Steps to prepare Eclipse : 

1) 	Create a folder named Eclipse_e-puck2

2)  	Download Eclipse IDE for C/C++ Developers archive version and unzip it into

	the new Eclipse_e-puck2 folder. You should obtain an eclipse folder.

3) 	Copy paste everything located in the installation Stuff folder to the new
 
	Eclipse_e-puck2 folder.
 Check replace if asked
4)	Download arm-none-eabi toolchain and unzip it into the Tools folder of the
 
	new Eclipse_e-puck2 folder.


5)	Unzip Workspace.zip and copy the Workspace folder next to the Tools folder
 of Eclipse_e-puck2

6)	Edit the gcc_path.txt file and verify if the path is correct for
 
	your installation.

7)	Execute Eclipse_e-puck2.exe and install thought the menu
 
	Help -> Install new software the plugin C/C++ GDB Hardware Debugging located

	in CDT Optional Features

8)	It’s done



Compress in zip file the folder Eclipse_e-puck2, rename it and distribute it.

Note : If the Zip archive is done with Windows, it doesn't include some files. It works with WinRar or 7Zip