#ifndef SourceDir
  #error SourceDir must be defined
#endif
#ifndef OutputDir
  #error OutputDir must be defined
#endif
#ifndef ProductVersion
  #error ProductVersion must be defined
#endif

#define SapiClsid "{61D23633-CE59-4101-8158-569FC6B51B49}"

[Setup]
AppId={{A4D6606A-8A23-4D26-9D91-7A9117C11919}
AppName=eSpeak NG {#ProductVersion} (32-bit)
AppVersion={#ProductVersion}
AppPublisher=eSpeak NG
DefaultDirName={autopf}\eSpeak NG
DefaultGroupName=eSpeak NG 32-bit
ArchitecturesAllowed=x86 x64
OutputDir={#OutputDir}
OutputBaseFilename=eSpeak-NG-{#ProductVersion}-x86-SAPI5-Setup
LicenseFile={#SourceDir}\COPYING
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Files]
Source: "{#SourceDir}\espeak-ng.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourceDir}\libespeak-ng.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourceDir}\espeak-voices.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#SourceDir}\espeak-ng-data\*"; DestDir: "{app}\espeak-ng-data"; Flags: recursesubdirs createallsubdirs ignoreversion

[Registry]
Root: HKLM; Subkey: "Software\eSpeak NG"; ValueType: string; ValueName: "Path"; ValueData: "{app}"; Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\Classes\CLSID\{#SapiClsid}"; ValueType: string; ValueName: ""; ValueData: "eSpeak NG TTS Engine"; Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\Classes\CLSID\{#SapiClsid}\InprocServer32"; ValueType: string; ValueName: ""; ValueData: "{app}\libespeak-ng.dll"; Flags: uninsdeletekey
Root: HKLM; Subkey: "Software\Classes\CLSID\{#SapiClsid}\InprocServer32"; ValueType: string; ValueName: "ThreadingModel"; ValueData: "Both"

[Icons]
Name: "{group}\eSpeak NG Command Prompt"; Filename: "{cmd}"; Parameters: "/K """"{app}\espeak-ng.exe"" --help"""

[Run]
Filename: "{app}\espeak-voices.exe"; Parameters: "install ""en en-us fa fa-en-us"" ""{app}"""; Flags: runhidden waituntilterminated

[UninstallRun]
Filename: "{app}\espeak-voices.exe"; Parameters: "remove x86"; Flags: runhidden waituntilterminated
