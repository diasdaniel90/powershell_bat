$LocalUser = Get-LocalUser
$pc = hostname
foreach ($User in $LocalUser){
	$nomeconsulta = $pc + "\" + $User.Name
	$cpfl = $pc + "\" + "dmin"
   
	$c = Get-LocalGroupMember -name administradores
		foreach ($d in $c){

			if ($nomeconsulta -eq $d.name -and $nomeconsulta -ne $cpfl){
				#Write-host "$nomeconsulta enabled status = " $User.Enabled
				Get-LocalUser $User | Disable-LocalUser
				#Write-host "$User desativado em $pc"
                   
			}
                
		}

	}