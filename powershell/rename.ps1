$serial = Get-WmiObject Win32_SystemEnclosure | select -expand SMBiosAssetTag

if($serial -eq ""){
    echo "serial � null"
}else{
    $newname = "N" + $serial
    #Rename-Computer -NewName $newname -Restart
}


