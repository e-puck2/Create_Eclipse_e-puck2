This folder contains all the modifications to make to an Eclipse installation to prepare it for e-puck 2 programming. It is a comports everything except Eclipse
installation and arm-none-eabi toolchain.

Installation Stuff folder contains all the stuff to copy into a new Eclipse_Mobots folder

The executable "Eclipse_Mobots" is made trough a Code::Blocks project named « Launcher »
It simply executes the Eclipse_Mobots.sh script localized in 
Eclipse_Mobots -> eclipse

It is possible to simply use the .sh file instead of the executable file 
but the executable is always launched when we double-click on it unlike a .sh file which by default is simply opened with a text editor.

Here is the directory structure to respect:

-Eclipse_Mobots		<- Eclipse Mobots main directory
--eclipse		<- Eclipse installation directory
——-plugins		<- Folder made by Eclipse containing its plugins
---Eclipse_Mobots.sh	<- Script to launch Eclipse with customized arguments
--Tools			<- Folder containing gcc-none-aebi toolchain
--Workspace		<- Folder containing the Eclipse Parameters
--Eclipse_Mobots	<- Executable to launch the Eclipse_Mobots.sh script
—-ReadMe.txt		<- ReadMe containing the how to use for the final user

Steps to prepare Eclipse : 
1) 	Create a folder named Eclipse_Mobots
2)  	Download Eclipse IDE for C/C++ Developers archive version and unzip it into
	the new Eclipse_Mobots folder.
3) 	Copy paste everything located in the installation Stuff folder to the new 
	Eclipse_Mobots folder.
4)	Download arm-none-eabi toolchain and unzip it into the Tools folder of the 
	new Eclipse_Mobots folder.
5)	Open the Eclipse_Mobots.sh script and verify if the paths are correct for 
	your installation.
6)	Execute Eclipse_Mobots and install thought the menu 
	Help -> Install new software the plugin C/C++ GDB Hardware Debugging located
	in CDT Optional Features
6)	It’s done

Compress in tar.gz file the folder Eclipse_Mobots, rename it and distribute it.
