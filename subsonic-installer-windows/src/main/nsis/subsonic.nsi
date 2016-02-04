# subsonic.nsi

#Should hopefully avoid false detection by Avast!
SetCompressor /SOLID lzma

!include "WordFunc.nsh"
!include "MUI.nsh"

!insertmacro VersionCompare

# The name of the installer
Name "Booksonic"

# The default installation directory
InstallDir $PROGRAMFILES\Booksonic

# Registry key to check for directory (so if you install again, it will
# overwrite the old one automatically)
InstallDirRegKey HKLM "Software\Booksonic" "Install_Dir"

#--------------------------------
#Interface Configuration

!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Header\orange.bmp"
!define MUI_FINISHPAGE_SHOWREADME "$INSTDIR\Getting Started.url"
!define MUI_FINISHPAGE_SHOWREADME_TEXT "View Getting Started tutorial"

#--------------------------------
# Pages

# This page checks for JRE
Page custom CheckInstalledJRE

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

# Languages
!insertmacro MUI_LANGUAGE "English"

Section "Subsonic"

  SectionIn RO

  # Install for all users
  SetShellVarContext "all"

  # Take backup of existing booksonic-service.exe.vmoptions
  CopyFiles /SILENT $INSTDIR\booksonic-service.exe.vmoptions $TEMP\booksonic-service.exe.vmoptions

  # Silently uninstall existing version.
  ExecWait '"$INSTDIR\uninstall.exe" /S _?=$INSTDIR'

  # Remove previous Jetty temp directory.
  RMDir /r "c:\booksonic\jetty"

  # Backup database.
  RMDir /r "c:\booksonic\db.backup"
  CreateDirectory "c:\booksonic\db.backup"
  CopyFiles /SILENT "c:\booksonic\db\*" "c:\booksonic\db.backup"

  # Set output path to the installation directory.
  SetOutPath $INSTDIR

  # Write files.
  File ..\..\..\target\booksonic-agent.exe
  File ..\..\..\target\booksonic-agent.exe.vmoptions
  File ..\..\..\target\booksonic-agent-elevated.exe
  File ..\..\..\target\booksonic-agent-elevated.exe.vmoptions
  File ..\..\..\target\booksonic-service.exe
  File ..\..\..\target\booksonic-service.exe.vmoptions
  File ..\..\..\..\subsonic-booter\target\booksonic-booter-jar-with-dependencies.jar
  File ..\..\..\..\subsonic-main\README.TXT
  File ..\..\..\..\subsonic-main\LICENSE.TXT
  File "..\..\..\..\subsonic-main\Getting Started.url"
  File ..\..\..\..\subsonic-main\target\booksonic.war
  File ..\..\..\..\subsonic-main\target\classes\version.txt
  File ..\..\..\..\subsonic-main\target\classes\build_number.txt

  # Write the installation path into the registry
  WriteRegStr HKLM SOFTWARE\Booksonic "Install_Dir" "$INSTDIR"

  # Write the uninstall keys for Windows
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Booksonic" "DisplayName" "Booksonic"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Booksonic" "UninstallString" '"$INSTDIR\uninstall.exe"'
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Booksonic" "NoModify" 1
  WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Booksonic" "NoRepair" 1
  WriteUninstaller "uninstall.exe"

  # Restore booksonic-service.exe.vmoptions
  CopyFiles /SILENT  $TEMP\booksonic-service.exe.vmoptions $INSTDIR\booksonic-service.exe.vmoptions
  Delete $TEMP\booksonic-service.exe.vmoptions

  # Write transcoding pack files.
  SetOutPath "c:\booksonic\transcode"
  File ..\..\..\..\subsonic-transcode\windows\*.*

  # Add Windows Firewall exception.
  # (Requires NSIS plugin found on http://nsis.sourceforge.net/NSIS_Simple_Firewall_Plugin to be installed
  # as NSIS_HOME/Plugins/SimpleFC.dll)

  SimpleFC::AdvAddRule "Booksonic Service (TCP)" "" "6" "1" "1" "7" "1" "$INSTDIR\booksonic-service.exe" "" "" "Booksonic" "" "" "" ""
  SimpleFC::AdvAddRule "Booksonic Service (UDP)" "" "17" "1" "1" "7" "1" "$INSTDIR\booksonic-service.exe" "" "" "Booksonic" "" "" "" ""
  SimpleFC::AdvAddRule "Booksonic Agent (TCP)" "" "6" "1" "1" "7" "1" "$INSTDIR\booksonic-agent.exe" "" "" "Booksonic" "" "" "" ""
  SimpleFC::AdvAddRule "Booksonic Agent (UDP)" "" "17" "1" "1" "7" "1" "$INSTDIR\booksonic-agent.exe" "" "" "Booksonic" "" "" "" ""
  SimpleFC::AdvAddRule "Booksonic Agent Elevated (TCP)" "" "6" "1" "1" "7" "1" "$INSTDIR\booksonic-agent-elevated.exe" "" "" "Booksonic" "" "" "" ""
  SimpleFC::AdvAddRule "Booksonic Agent Elevated (UDP)" "" "17" "1" "1" "7" "1" "$INSTDIR\booksonic-agent-elevated.exe" "" "" "Booksonic" "" "" "" ""

  # Install and start service.
  ExecWait '"$INSTDIR\booksonic-service.exe" -install'
  ExecWait '"$INSTDIR\booksonic-service.exe" -start'

  # Start agent.
  Exec '"$INSTDIR\booksonic-agent-elevated.exe" -balloon'

SectionEnd


Section "Start Menu Shortcuts"

  CreateDirectory "$SMPROGRAMS\Booksonic"
  CreateShortCut "$SMPROGRAMS\Booksonic\Open Booksonic.lnk"          "$INSTDIR\booksonic.url"         ""         "$INSTDIR\booksonic-agent.exe"  0
  CreateShortCut "$SMPROGRAMS\Booksonic\Booksonic Tray Icon.lnk"     "$INSTDIR\booksonic-agent.exe"   "-balloon" "$INSTDIR\booksonic-agent.exe"  0
  CreateShortCut "$SMPROGRAMS\Booksonic\Start Booksonic Service.lnk" "$INSTDIR\booksonic-service.exe" "-start"   "$INSTDIR\booksonic-service.exe"  0
  CreateShortCut "$SMPROGRAMS\Booksonic\Stop Booksonic Service.lnk"  "$INSTDIR\booksonic-service.exe" "-stop"    "$INSTDIR\booksonic-service.exe"  0
  CreateShortCut "$SMPROGRAMS\Booksonic\Uninstall Booksonic.lnk"     "$INSTDIR\uninstall.exe"        ""         "$INSTDIR\uninstall.exe" 0
  CreateShortCut "$SMPROGRAMS\Booksonic\Getting Started.lnk"        "$INSTDIR\Getting Started.html" ""         "$INSTDIR\Getting Started.html" 0

  CreateShortCut "$SMSTARTUP\Booksonic.lnk"                         "$INSTDIR\booksonic-agent.exe"   ""         "$INSTDIR\booksonic-agent.exe"  0

SectionEnd


# Uninstaller

Section "Uninstall"

  # Uninstall for all users
  SetShellVarContext "all"

  # Stop and uninstall service if present.
  ExecWait '"$INSTDIR\booksonic-service.exe" -stop'
  ExecWait '"$INSTDIR\booksonic-service.exe" -uninstall'

  # Stop agent by killing it.
  # (Requires NSIS plugin found on http://nsis.sourceforge.net/Processes_plug-in to be installed
  # as NSIS_HOME/Plugins/Processes.dll)
  Processes::KillProcess "booksonic-agent"
  Processes::KillProcess "booksonic-agent-elevated"
  Processes::KillProcess "ffmpeg"

  # Remove registry keys
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Booksonic"
  DeleteRegKey HKLM SOFTWARE\Booksonic

  # Remove files.
  Delete "$SMSTARTUP\Booksonic.lnk"
  RMDir /r "$SMPROGRAMS\Booksonic"
  Delete "$INSTDIR\build_number.txt"
  Delete "$INSTDIR\elevate.exe"
  Delete "$INSTDIR\Getting Started.url"
  Delete "$INSTDIR\LICENSE.TXT"
  Delete "$INSTDIR\README.TXT"
  Delete "$INSTDIR\booksonic.url"
  Delete "$INSTDIR\booksonic.war"
  Delete "$INSTDIR\booksonic-agent.exe"
  Delete "$INSTDIR\booksonic-agent.exe.vmoptions"
  Delete "$INSTDIR\booksonic-agent-elevated.exe"
  Delete "$INSTDIR\booksonic-agent-elevated.exe.vmoptions"
  Delete "$INSTDIR\booksonic-booter-jar-with-dependencies.jar"
  Delete "$INSTDIR\booksonic-service.exe"
  Delete "$INSTDIR\booksonic-service.exe.vmoptions"
  Delete "$INSTDIR\uninstall.exe"
  Delete "$INSTDIR\version.txt"
  RMDir /r "$INSTDIR\log"
  RMDir "$INSTDIR"

  # Remove Windows Firewall exception.
  # (Requires NSIS plugin found on http://nsis.sourceforge.net/NSIS_Simple_Firewall_Plugin to be installed
  # as NSIS_HOME/Plugins/SimpleFC.dll)
  SimpleFC::AdvRemoveRule "Booksonic Service (TCP)"
  SimpleFC::AdvRemoveRule "Booksonic Service (UDP)"
  SimpleFC::AdvRemoveRule "Booksonic Agent (TCP)"
  SimpleFC::AdvRemoveRule "Booksonic Agent (UDP)"
  SimpleFC::AdvRemoveRule "Booksonic Agent Elevated (TCP)"
  SimpleFC::AdvRemoveRule "Booksonic Agent Elevated (UDP)"

SectionEnd


Function CheckInstalledJRE
    # Read the value from the registry into the $0 register
    ReadRegStr $0 HKLM "SOFTWARE\JavaSoft\Java Runtime Environment" CurrentVersion

    # Check JRE version. At least 1.6 is required.
    #   $1=0  Versions are equal
    #   $1=1  Installed version is newer
    #   $1=2  Installed version is older (or non-existent)
    ${VersionCompare} $0 "1.6" $1
    IntCmp $1 2 InstallJRE 0 0
    Return

    InstallJRE:
      # Launch Java web installer.
      MessageBox MB_OK "Java was not found and will now be installed."
      File /oname=$TEMP\jre-setup.exe jre-8u31-windows-i586-iftw.exe
      ExecWait '"$TEMP\jre-setup.exe"' $0
      Delete "$TEMP\jre-setup.exe"

FunctionEnd
