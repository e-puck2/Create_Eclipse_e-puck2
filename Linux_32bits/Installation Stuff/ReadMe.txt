**To use, simply place the folder Eclipse_Mobots where you want. It is just needed to have no space in the names of the parents folders.
Also avoid special characters.

Example : 	/home/student/epfl_stuff/Eclipse_mobots	OK
		/home/student/epfl stuff/Eclipse_mobots	NOT OK


Next you can create a shortcut of the Eclipse_Mobots executable if you want

**Some programs need to be installed in order to run Eclipse

For 64 bits Ubuntu :
- 32 bits app support
- OpenJDK 8 32 bits

--To install 32 bits app support :
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386

--To install OpenJDK 8 32 bits :
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install openjdk-8-jre:i386


For 32 bits Ubuntu :
- OpenJDK 8 32 bits

--To install OpenJDK 8 32 bits :
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install openjdk-8-jre

**If Eclipse_Mobots says « Could not open serial port /dev/tty* » when trying to debug, you have to type the following command in the terminal to put your user into the dialout group.

« sudo adduser $USER dialout »

Then restart your linux session and it should works.

