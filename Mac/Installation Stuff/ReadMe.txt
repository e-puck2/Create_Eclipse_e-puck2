Eclipse_e-puck2 version 5

**Simply drag and drop Eclipse_e-puck2.app in the Application folder (or where you want). It is just needed to have no space in the names of the parents folders.
Also avoid special characters.

Example : 	/home/student/epfl_stuff/Eclipse_e-puck2	OK
		/home/student/epfl stuff/Eclipse_e-puck2	NOT OK

**To be able to run Eclipse, Java 8 JDK must be installed.

—-To install OpenJDK 8 JDK :
-Go to https://adoptopenjdk.net/releases.html
and download the openJDK 8 (LTS) HotSpot for MacOS x64 JDK (take the installer, aka. .pkg file)
-Open the downloaded .dmg file, execute the installer and follow the instructions

—-To launch Eclipse the First time :
Mac OS X has a GateKeeper functionality which prevents the user to execute unknown
programs. 
If the following message 
« Unable to open "Eclipse_e-puck2.app" because this app comes from an unidentified developer. » 
appears when double-clicking on Eclipse_e-puck2 or if 
« "Eclipse.app" is corrupted and can not be opened. You should place this item in the Trash. »
appears, it is necessary to go to System Preferences->security and privacy->General and authorize downloaded application from anywhere. It should now be possible to launch Eclipse_e-puck2. After the first successful launch, the setting can be set back to its original value because now, the application is trusted. The first launch of Eclipse_e-puck2 is longer because of Gatekeeper, and it is possible to see two times Eclipse on the Dock. This is because we use an Eclipse_e-puck2.app which launches Eclipse.app with some custom parameters.

!!!! Important !!!!
On MacOs Sierra or above, it is not possible anymore to select « anywhere » in the security preferences.
It is necessary to type the following command in the terminal.

sudo spctl --master-disable

Then it should be possible to select « anywhere ».
At the end, when Eclipse has been launched, type the following command to set back the security

sudo spctl --master-enable