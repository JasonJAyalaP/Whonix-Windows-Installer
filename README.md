Download:

The Whonix Installer for Windows installs VirtualBox and imports the whonix OVAs. This repository contains an InnoSetup config file and resources.

# Building from source

## Preparation

* Download a copy of this repository. Use its folder to collect required files for building.
  * https://github.com/Whonix/Whonix-Windows-Installer
* Download the Whonix VirtualBox XFCE image to the folder and renamed it to "whonix.ova"
  * https://www.whonix.org/wiki/VirtualBox/XFCE
* Download and install Inno Setup
  * http://www.jrsoftware.org/isdl.php
* Whonix-UI executable in the folder
  * Built from source: https://www.whonix.org/wiki/Building_Whonix-UI_for_Windows
* Download the newest "Windows hosts" VirtualBox installer to any location. 
  * https://www.virtualbox.org/wiki/Downloads
* Navigate in the commandline to that location and run 
<pre>
VirtualBox[Characters based on your version].exe -extract
</pre>
  * A window will open telling you where its files have been extracted. Navigate to this folder, rename "VirtualBox[Characters based on your version]amd64.msi" to "virtualbox_x64.msi" and move it to the repository/build folder.

## Build

Your build folder should have at least:

* license.txt
* logo.ico
* virtualbox_x64.msi
* Whonix.exe
* Whonix.iss
* whonix.ova

Optional: Open Whonix.iss and change AppVersion. Set Compression as desired (https://documentation.help/Inno-Setup/topic_setup_compression.htm)

Right-click Whonix.iss and select "Compile". The executable is in Output.

Note: If OVA becomes greater than 2GB, Whonix.iss must be set to use DiskSpanning=Yes. This will output an exe and .bin file. To combine, add *7za.exe* and *7zSD.sfx* to the 7zip folder. Open *7zip/make self extract.bat*, which combines everything in Output into a 7z archive and then into a self-extracting-and-running exe. 
