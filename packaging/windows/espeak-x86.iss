#ifndef SourceDir
  #error SourceDir must be defined
#endif
#ifndef OutputDir
  #error OutputDir must be defined
#endif
#ifndef SapiDll
  #error SapiDll must be defined
#endif

[Setup]
AppId={{8D4A8F5A-1C9F-4F6A-8E8B-4A3F2B69A020}
AppName=eSpeak 1.48.15 (32-bit)
AppVersion=1.48.15
AppPublisher=eSpeak
DefaultDirName={autopf}\eSpeak
DefaultGroupName=eSpeak 32-bit
ArchitecturesAllowed=x86 x64
OutputDir={#OutputDir}
OutputBaseFilename=eSpeak-1.48.15-x86-SAPI-Setup
LicenseFile={#SourceDir}\COPYING
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Files]
Source: "{#SourceDir}\espeak.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SapiDll}"; DestDir: "{app}"; DestName: "espeak_sapi.dll"; Flags: ignoreversion regserver uninsregserver
Source: "{#SourceDir}\espeak-voices.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourceDir}\espeak-data\*"; DestDir: "{app}\espeak-data"; Flags: recursesubdirs createallsubdirs ignoreversion

[Icons]
Name: "{group}\eSpeak Command Prompt"; Filename: "{cmd}"; Parameters: "/K """"{app}\espeak.exe"" --help"""

[Run]
Filename: "{app}\espeak-voices.exe"; Parameters: "install ""en en-us fa fa-en-us"" ""{app}"""; Flags: runhidden waituntilterminated

[UninstallRun]
Filename: "{app}\espeak-voices.exe"; Parameters: "remove x86"; Flags: runhidden waituntilterminated
