[Setup]
AppName=Whonix
AppVersion=13.0.0.1.4
DefaultDirName={pf}\Whonix
DefaultGroupName=Whonix
OutputBaseFilename=InstallWhonix
UninstallDisplayIcon={app}\Whonix.exe
LicenseFile=license.txt
SetupIconFile=logo.ico
Compression=lzma2
ArchitecturesInstallIn64BitMode=x64
DiskSpanning=yes
PrivilegesRequired=admin

[Files]
Source: "virtualbox_x64.msi"; DestDir: "{tmp}"; Check: Is64BitInstallMode
Source: "virtualbox_x86.msi"; DestDir: "{tmp}"; Check: not Is64BitInstallMode
Source: "common.cab"; DestDir: "{tmp}"
Source: "Whonix.exe"; DestDir: "{app}"
Source: "whonix_gateway.ova"; DestDir: "{tmp}"
Source: "whonix_workstation.ova"; DestDir: "{tmp}"

[Run]
Filename: msiexec.exe; Parameters: "/x ""{tmp}\virtualbox_x64.msi"" /quiet"; Flags: skipifdoesntexist runascurrentuser; StatusMsg: "Removing previous VirtualBox install. Please wait..."

Filename: msiexec.exe; Parameters: "/x ""{tmp}\virtualbox_x86.msi"" /quiet"; Flags: skipifdoesntexist runascurrentuser; StatusMsg: "Removing previous VirtualBox install. Please wait..."

Filename: msiexec.exe; Parameters: "/i ""{tmp}\virtualbox_x64.msi"" INSTALLDIR=""{app}"" /quiet"; Flags: skipifdoesntexist runascurrentuser; StatusMsg: "VirtualBox is being installed. Please Wait..."

Filename: msiexec.exe; Parameters: "/i ""{tmp}\virtualbox_x86.msi"" INSTALLDIR=""{app}"" /quiet"; Flags: skipifdoesntexist runascurrentuser; StatusMsg: "VirtualBox is being installed. Please Wait..."

Filename: "{app}\VboxManage.exe"; Parameters: "import ""{tmp}\whonix_gateway.ova"" --vsys 0 --eula accept"; Flags: runhidden; StatusMsg: "Importing Whonix Gateway. Please Wait..."

Filename: "{app}\VboxManage.exe"; Parameters: "import ""{tmp}\whonix_workstation.ova"" --vsys 0 --eula accept"; Flags: runhidden; StatusMsg: "Importing Whonix Workstation. Please Wait..."

Filename: "{app}\Whonix.exe"; Flags: nowait postinstall
