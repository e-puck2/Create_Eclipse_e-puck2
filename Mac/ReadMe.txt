This folder contains all the modifications to make to an Eclipse installation to prepare it for e-puck 2 programming. It is a comports everything except Eclipse
installation and arm-none-eabi toolchain.

Installation Stuff folder contains the Eclipse_Mobots.app and its ReadMe.txt
Plugin Stuff folder contains the plugin EmbSysRegView for Eclipse.app 
Eclipse_Mobots_Model.sparseimage is a model of the distribution dmg file
Worspace.zip contains the Workspace for Eclipse

Unlike Windows and Linux versions, we can create an application bundle without having to have an executable file.

The Eclipse_Mobots.app contains a script localized in 
Eclipse_Mobots.app -> Contents -> MacOS -> Eclipse_Mobots which is executed when double-clicking on the app. It behaves like an executable.

Here is the directory structure to respect:

-Eclipse_Mobots	.app	<- Eclipse Mobots main directory (seen like an application)
—-Contents		<- Folder
——-MacOS		<- Folder containing the script launched when opening the app
———-Eclipse_Mobots	<- Script to launch Eclipse with customized arguments
———Eclipse_Mobots	<- Folder containing Eclipse 
———-eclipse.app		<- Eclipse installation directory (seen like an application)
————-Contents		<- Folder
—————-Eclipse		<- Folder
——————-plugins		<- Folder made by Eclipse containing its plugins
———-Tools		<- Folder containing gcc-none-aebi toolchain
———-Workspace		<- Folder containing the Eclipse Parameters
-ReadMe.txt		<- ReadMe containing the how to use for the final user

Steps to prepare Eclipse : 
1) 	Create a folder named Eclipse_Mobots
2) 	Copy paste the everything located in the Installation Stuff folder to the new 
	Eclipse_Mobots folder.
3)  	Download Eclipse IDE for C/C++ Developers dmg version and open it.
4)	Drag and drop the Eclipse.app into
	Eclipse_Mobots.app -> Contents -> Eclipse_Mobots
5)	Copy everything inside the Plugin Stuff folder into the plugin folder of the 
	freshly copied Eclipse.app.
	Eclipse.app -> Contents -> Eclipse -> plugins
6) 	Unzip Workspace.zip and copy the Workspace folder next to the Tools folder
	of Eclipse_Mobots.app
	Eclipse_Mobots.app -> Contents -> Eclipse_Mobots
7)	Download arm-none-eabi toolchain and unzip it into the Tools folder of the
	Eclipse_Mobots.app 
	Eclipse_Mobots.app -> Contents -> Eclipse_Mobots -> Tools
8)	Open the Eclipse_Mobots script with a text editor and verify if the paths are 	correct for your installation.
9)	Execute Eclipse_Mobots.app and install thought the menu 
	« Help -> Install new software » the plugin C/C++ GDB Hardware Debugging 
	located in CDT Optional Features
10)	It’s done

Steps to create a dmg file to distribute Eclipse_Mobots.app
1)	Copy Eclipse_Mobots_Model.sparseimage somewhere and open the copied image
2)	Open the volume Eclipse_mobots which should have appeared
3) 	Copy into it what is contained in the folder Eclipse_Mobots we created 
	earlier (ReadMe.txt and Eclipse_Mobots.app).
	Click on replace when prompted by the system.
4)	Eject the volume Eclipse_Mobots
5)	Open Disk Utility and go to image -> Convert
6)	Choose the Eclipse_Mobots_Model.sparseimage you copied
7)	Choose a distribution name, where it should be saved, set Encryption to none 
	and set the image format to compressed.
8)	You now have a dmg file that can be distribute


