# Apps

winget uninstall "Copilot" --accept-source-agreements
winget uninstall "Start Experiences App"
winget uninstall "Dev Home (Preview)"
winget uninstall "Dev Home"
winget uninstall "Feedback Hub"
winget uninstall "Game Bar"
winget uninstall "Game Speech Window"
winget uninstall "Get Help"
winget uninstall "MSN Weather"
winget uninstall "Microsoft 365 (Office)"
winget uninstall "Microsoft Bing Search"
winget uninstall "Microsoft Clipchamp"
winget uninstall "Microsoft Family"
winget uninstall "Microsoft News"
winget uninstall "Microsoft OneDrive"
winget uninstall "Microsoft Photos"
winget uninstall "Microsoft Sticky Notes"
winget uninstall "Microsoft Teams"
winget uninstall "Microsoft To Do"
winget uninstall "Outlook for Windows"
# winget uninstall "Paint"
winget uninstall "Phone Link"
winget uninstall "Power Automate"
winget uninstall "Quick Assist"
winget uninstall "Solitaire & Casual Games"
winget uninstall "Widgets Platform Runtime"
winget uninstall "Windows Camera"
winget uninstall "Windows Clock"
winget uninstall "Windows Media Player"
# winget uninstall "Windows Notepad"
winget uninstall "Windows Sound Recorder"
winget uninstall "Windows Terminal"
winget uninstall "Windows Web Experience Pack"
winget uninstall "Xbox Identity Provider"
winget uninstall "Xbox TCUI"
winget uninstall "Xbox"

# Machine

# Windows Defender exclusions

Add-MpPreference -ExclusionPath D:\Apps
Add-MpPreference -ExclusionPath D:\Users

# Connected User Experiences and Telemetry

Set-Service -Name DiagTrack -StartupType Disabled # was Automatic
Stop-Service -Name DiagTrack

# Device Management Wireless Application Protocol (WAP) Push message Routing Service

Set-Service -Name dmwappushservice -StartupType Disabled # was Manual

# Scheduled tasks related to telemetry

Disable-ScheduledTask "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" | Out-Null
Disable-ScheduledTask "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" | Out-Null

# Disable Recall

dism /Online /NoRestart /Disable-Feature /FeatureName:Recall
# dism /Online /NoRestart /Get-FeatureInfo /FeatureName:Recall

# Registry

Start-Process `
  -FilePath "regedit.exe" `
  -ArgumentList "/s", (Join-Path -Path $PSScriptRoot -ChildPath "clean.reg") `
  -Wait

