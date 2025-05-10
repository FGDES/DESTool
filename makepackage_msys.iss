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
OutputDir=.\release
OutputBaseFilename=destool-{#VMAJOR}_{#VMINOR}_setup
SetupIconFile=images\icon_red_win.ico
LicenseFile=License.txt

[Dirs]
Name: {app}\Examples
Name: {app}\Doc
Name: {app}\plugins

[Files]
Source: release\Qt*; DestDir: {app}
Source: release\viodes.dll; DestDir: {app}
Source: release\vioconfig.txt; DestDir: {app}
Source: release\faudes.dll; DestDir: {app}
Source: release\libfaudes.rti; DestDir: {app}
Source: release\assistant.exe; DestDir: {app}
;Source: release\qhelpgenerator.exe; DestDir: {app}
;Source: release\qcollectiongenerator.exe; DestDir: {app}
Source: release\*.exe; DestDir: {app}
Source: License.txt; DestDir: {app}
;Source: README.txt; DestDir: {app}
Source: release\plugins\*; DestDir: {app}\plugins;    Flags: recursesubdirs createallsubdirs
Source: tutorial\distsave\*; DestDir: {app}\Examples;  Flags: recursesubdirs createallsubdirs;
Source: doc\html\*; DestDir: {app}\Doc;             Flags: recursesubdirs createallsubdirs;  


[Icons]
Name: "{group}\DESTool"; Filename: "{app}\destool.exe"
Name: "{group}\Uninstall DESTool"; Filename: "{uninstallexe}"
Name: "{commondesktop}\DESTool"; Filename: "{app}\destool.exe" 
