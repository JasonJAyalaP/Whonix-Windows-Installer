Download:

The Whonix Installer for Windows installs VirtualBox and imports the whonix OVAs. This repository contains an InnoSetup config file and resources.

= Building from source =

== Preparation ==

* Download a copy of this repository. Use its folder to collect required files for building.
** https://github.com/Whonix/Whonix-Windows-Installer
* Download the Whonix VirtualBox XFCE image to the folder and renamed it to "whonix.ova"
** https://www.whonix.org/wiki/VirtualBox/XFCE
* Download and install InnoSetup Unicode
** http://www.jrsoftware.org/isdl.php
* Download the Whonix-UI executable to the folder: https://github.com/Whonix/Whonix-Windows-UI/releases
** OR build from source: https://www.whonix.org/wiki/Building_Whonix-UI_for_Windows
* Download the newest "Windows hosts" VirtualBox installer to any location. 
** https://www.virtualbox.org/wiki/Downloads
** Navigate in the commandline to that location and run 
<pre>
VirtualBox[Characters based on your version].exe -extract
</pre>
** A window will open telling you where its files have been extracted. Navigate to this folder, rename "VirtualBox[Characters based on your version]amd64.msi" to "virtualbox_x64.msi" and move it to the repository/build folder.

== Build ==

Your build folder should have at least:

* config.txt
* license.txt
* logo.ico
* MakeInstaller.bat
* virtualbox_x64.msi
* Whonix.exe
* Whonix.iss
* whonix.ova

Open "MakeInstaller.bat" and wait for building to finish. The executable is in Output.
