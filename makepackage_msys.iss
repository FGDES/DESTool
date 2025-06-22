; Installer Configuration for DESTool MS Windows distribution
;
; As of 2025, we are using Inno Setup version 6.5
;

[Setup]
;Windows 11 first release
;MinVersion=10.0.22000
;Windows 10, 2018 upgrade
MinVersion=10.0.17763
AppCopyright=Thomas Moor
AppName=DESTool
AppVersion={#VMAJOR}.{#VMINOR}
AppVerName=DESTool {#VMAJOR}.{#VMINOR}
ArchitecturesInstallIn64BitMode=x64compatible
ArchitecturesAllowed=x64compatible
PrivilegesRequired=none
ShowLanguageDialog=no
LanguageDetectionMethod=uilanguage
AppID={{21DE0516-4938-4621-9995-6A5EF2BDE2FF}}
UsePreviousAppDir=false
DefaultDirName={sd}\FAUDES\DESTool
DefaultGroupName=FAUDES
OutputDir=.\
OutputBaseFilename=faudes_destool_{#VMAJOR}_{#VMINOR}_setup
SetupIconFile=images\icon_red_win.ico
LicenseFile=.\LICENSE

[Dirs]
Name: {app}\Examples
Name: {app}\Doc
Name: {app}\plugins

[Files]
Source: release\*;  DestDir:  {app}\;           Flags: recursesubdirs createallsubdirs
Source: examples\*; DestDir:  {app}\Examples;   Flags: recursesubdirs createallsubdirs;
Source: doc\html\*; DestDir:  {app}\Doc;        Flags: recursesubdirs createallsubdirs;  
Source: LICENSE;    DestDir:  {app}\; DestName: License.txt
Source: README.md;  DestDir:  {app}\; DestName: ReadMe.txt


[Icons]
Name: "{group}\DESTool"; Filename: "{app}\destool.exe"
Name: "{group}\Uninstall DESTool"; Filename: "{uninstallexe}"
;Name: "{commondesktop}\DESTool"; Filename: "{app}\destool.exe" 
;Name: "{userdesktop}\DESTool"; Filename: "{app}\destool.exe" 
