set source=%~dp0
powershell -ex bypass -c Add-AppxProvisionedPackage -Online -PackagePath "%source%\maxxaudio\e" -LicensePath "C:\Temp\maxxaudio\2ccdddb44_License1.xml"
pause