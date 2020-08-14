Each Eclipse_e-puck2 folder has more or less the same structure.

It is composed of:
1) eclipse folder which contains the eclipse package with the plugins
2) Tools folder which contains dedicated tools needed by the platform (toolchain, make, etc)
3) Workspace folder which contains all the settings of the eclipse package
4) Eclipse_e-puck2 executable which launches eclipse with the given Workspace and the PATH needed to use the Tools folder.

Content of Eclipse (all platforms)

-Eclipse IDE for C/C++ Developers (Oxygen 4.7.2)
-Plugins
--C/C++ GDB Hardware Debugging
--EmbSysRegView 0.2.6 (with custom SVD)
—-ChibiOs board config generator tool 1.10.1 (with custom template aka. stm32f4xx_e-puck2)

Configuration made into Eclipse (kept in the Workspace)
-There is an example of a debugger configuration to work with a BlackMagic Probe (caleed Generic Blackmagic Probe)
-The views and perspectives have been a little modified to already have the good views when coding or debugging
-"Symbol is not resolved" and "Type cannot be resolved" errors have been disabled in the Code Analysis settings because they give to many errors.
-The parameter "Eclipse->preferences->C/C++->New C/C++Project Wizard->Makefile Project->Discovery Options->Automate discovery of paths and symbols" has been checked in order to automatically find the folders to include to the project to have the Code Analysis working correctly.
-The two first filters in the debug configuration view are checked to not show deleted or closed
-A variable called "COM_PORT" has been added in the string substitution tab in order to be able to use it with the debug configurations if wanted. (Useful if we have several debug config. Then we could only change this variable to change the com port of all the debug config using this variable)