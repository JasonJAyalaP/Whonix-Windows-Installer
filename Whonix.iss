#define MyAppName "Whonix"
#define MyAppExeName "Whonix.exe"
#define MyAppIcoName "logo.ico"

[Setup]
AppName={#MyAppName}
AppVersion=15.0.1.3.4
DefaultDirName={commonpf}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputBaseFilename=whonix-installer
UninstallDisplayIcon={app}\{#MyAppExeName}
LicenseFile=license.txt
SetupIconFile={#MyAppIcoName}
AllowNoIcons=yes
Compression=none
ArchitecturesInstallIn64BitMode=x64
DiskSpanning=no
PrivilegesRequired=admin

[Files]
Source: "virtualbox_x64.msi"; DestDir: "{app}"; Check: Is64BitInstallMode
Source: "Whonix.exe"; DestDir: "{app}"
Source: "whonix.ova"; DestDir: "{tmp}"

[Run]
Filename: msiexec.exe; Parameters: "/x ""{app}\virtualbox_x64.msi"" /quiet"; Flags: skipifdoesntexist runascurrentuser; StatusMsg: "Removing previous VirtualBox install. Please wait..."

Filename: msiexec.exe; Parameters: "/i ""{app}\virtualbox_x64.msi"" INSTALLDIR=""{app}"" /quiet"; Flags: skipifdoesntexist runascurrentuser; StatusMsg: "VirtualBox is being installed. Please Wait..."

Filename: "{app}\VboxManage.exe"; Parameters: "import ""{tmp}\whonix.ova"" --vsys 0 --eula accept --vsys 1 --eula accept"; Flags: runhidden; StatusMsg: "Importing Whonix. Please Wait..."

Filename: "{app}\Whonix.exe"; Flags: nowait postinstall

[Icons]
Name: "{userdesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"

Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"

Name: "{group}\Uninstall Whonix"; Filename: "{uninstallexe}"

[UninstallRun]

Filename: "{app}\VboxManage.exe"; Parameters: "unregistervm Whonix-Gateway-XFCE --delete"; Flags: runhidden; StatusMsg: "Removing Whonix-Gateway-XFCE. Please Wait..."

Filename: "{app}\VboxManage.exe"; Parameters: "unregistervm Whonix-Workstation-XFCE --delete"; Flags: runhidden; StatusMsg: "Removing Whonix-Workstation-XFCE. Please Wait..."

Filename: msiexec.exe; Parameters: "/x ""{app}\virtualbox_x64.msi"" /quiet"; Flags: skipifdoesntexist runascurrentuser; StatusMsg: "Removing previous VirtualBox install. Please wait..."

[UninstallDelete]
Type: dirifempty; Name: "{%USERPROFILE}\VirtualBox VMs"

Type: filesandordirs; Name: "{%USERPROFILE}\.VirtualBox"

Type: dirifempty; Name: "{app}"
