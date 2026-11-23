#ifndef SourceDir
  #error SourceDir must be defined
#endif
#ifndef OutputDir
  #error OutputDir must be defined
#endif

[Setup]
AppId={{C91BC74C-B914-4A6B-9550-0CB2E5FEBC35}
AppName=eSpeak
AppVersion=1.48.15
AppPublisher=eSpeak
DefaultDirName={autopf}\eSpeak
DefaultGroupName=eSpeak
OutputDir={#OutputDir}
OutputBaseFilename=eSpeak-1.48.15-Setup
LicenseFile={#SourceDir}\COPYING
ArchitecturesInstallIn64BitMode=x64
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Files]
Source: "{#SourceDir}\espeak.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourceDir}\espeak-data\*"; DestDir: "{app}\espeak-data"; Flags: recursesubdirs createallsubdirs ignoreversion

[Icons]
Name: "{group}\eSpeak Command Prompt"; Filename: "{cmd}"; Parameters: "/K """"{app}\espeak.exe"" --help"""
