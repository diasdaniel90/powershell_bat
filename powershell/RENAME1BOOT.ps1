$nome="s"
function verificaNome([string]$nome){
    echo "nome $nome"
    $tipo=$nome.Substring(0,1)
    $num=$nome.Substring(1,$nome.Length-1)
    $valido=$false
    try{
    $num=[int]$num
    if(($tipo -eq "D") -or ($tipo -eq "N") -and ($num.GetType().name -eq "Int32") -and ($nome.Length -eq 8)){
        #echo "não precisa alterar o host"
       $valido=$true
        }else{
             $valido=$false
        }
    }
    catch{
        $valido=$false
    }
    return $valido
}


$serial = Get-WmiObject Win32_SystemEnclosure | select -expand SMBiosAssetTag
$newname = "N" + $serial
verificaNome $nome
verificaNome $newname

if((verificaNome $nome) -eq $true){
    echo "nome atual correto"
    #Add-Computer -DomainName fl.com.br -Credential fl.com.br\ -Options AccountCreate -Restart -Force
}
elseif((verificaNome $newname) -eq $true){
    verificaNome $newname
    echo "AssentTag correto"
    Rename-Computer -NewName $newname 
    Add-Computer -DomainName fl.com.br -Credential fl.com.br\ -Options JoinWithNewName,AccountCreate -Restart -Force
}
elseif((verificaNome $nome) -ne $true) {
        echo "nome errado, assent errado"
     sysdm.cpl
}else{
    echo "ai não sei"
}
