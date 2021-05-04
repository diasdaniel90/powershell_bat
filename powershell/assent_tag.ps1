Get-WmiObject Win32_SystemEnclosure | select -expand SMBiosAssetTag

#Gravar Asset Tag no Think
#https://support.lenovo.com/br/en/downloads/ds039503
#Para consultar o campo use o powershell:
Get-WmiObject -Class Win32_SystemEnclosure
 (Get-WmiObject Win32_SystemEnclosure).SMBiosAssetTag 
 
 #.\WinAIA64.exe set-from-file .\nome.bat
 # USERASSETDATA.ASSET_NUMBER=

