7za a -m0=Copy ..\Output\Installer ..\Output\
copy /b 7zSD.sfx + config.txt + ..\Output\Installer.7z ..\Output\whonix-installer.sfx.exe
pause
