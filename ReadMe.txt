Each Eclipse_Mobots folder has more or less the same structure.

It is composed of:
1) eclipse folder which contains the eclipse package with the plugins
2) Tools folder which contains dedicated tools needed by the platform (toolchain, make, etc)
3) Workspace folder which contains all the settings of the eclipse package
4) Eclipse_Mobots executable which launches eclipse with the given Workspace and the PATH needed to use the Tools folder.

Content of Eclipse (all platforms)

-Eclipse IDE for C/C++ Developers (Oxygen 4.7.2)
-Plugins
--C/C++ GDB Hardware Debugging
--EmbSysRegView 0.2.6 (with custom SVD)
—-ChibiOs board config generator tool 1.10.1 (with custom template aka. stm32f4xx_e-puck2)

Configuration made into eclipse (kept in the Workspace)
-debugger is configured to work with a BlackMagic Probe
-The views and perspectives have been a little modified to already have the good views when coding or debugging
-"Symbol is not resolved" and "Type cannot be resolved" errors have been disabled in the Code Analysis settings because they give to many errors.