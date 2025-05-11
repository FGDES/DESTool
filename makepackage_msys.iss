; Installer Configuration for DESTool MS Windows distribution
;
; As of 2025, we are using Inno Setup version 6.5
;

[Setup]
MinVersion=10.0.22000
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
OutputBaseFilename=destool-{#VMAJOR}_{#VMINOR}_setup
SetupIconFile=images\icon_red_win.ico
LicenseFile=.\release\License.txt

[Files]
Source: release\*; DestDir: {app};    Flags: recursesubdirs createallsubdirs

[Icons]
Name: "{group}\DESTool"; Filename: "{app}\destool.exe"
Name: "{group}\Uninstall DESTool"; Filename: "{uninstallexe}"
Name: "{commondesktop}\DESTool"; Filename: "{app}\destool.exe" 
