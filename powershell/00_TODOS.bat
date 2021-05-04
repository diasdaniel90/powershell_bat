set source=%~dp0
powershell -ex bypass -c Add-AppxProvisionedPackage -Online -PackagePath "%source%\maxxaudio\.appxbundle" -LicensePath "C:\Temp\maxxaudio\2c_License1.xml"
powershell -ex bypass -c "%source%\script_seg.ps1"
del C:\Temp
pause