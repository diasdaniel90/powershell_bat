set source=%~dp0
COPY %source%\gsskrb5.dll C:\Windows\System32
regsvr32.exe /s gsskrb5.dll

pause