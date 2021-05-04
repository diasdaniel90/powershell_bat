set source=%~dp0
powershell -ex bypass -c "%source%DISABLE_IPV6.ps1"
#Get-NetAdapterBinding -ComponentID 'ms_tcpip6' | disable-NetAdapterBinding -ComponentID 'ms_tcpip6' –PassThru 
pause

