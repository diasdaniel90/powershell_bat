<# This form was created using POSHGUI.com  a free online gui designer for PowerShell
.NAME
    Untitled
#>
#Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted -Force

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName PresentationFramework

[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(588,366)
$Form.text                       = "INGRESSAR NO DOMINIO"
$Form.TopMost                    = $false
$form.StartPosition              = 'CenterScreen'
$form.Topmost                    = $true

$ListBox1                        = New-Object system.Windows.Forms.ListBox
$ListBox1.width                  = 226
$ListBox1.height                 = 180
$ListBox1.location               = New-Object System.Drawing.Point(26,172)
$ListBox1.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))


$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "VAMOS ADICIONAR ESSE HOST NO DOMINIO!"
$Label1.AutoSize                 = $true
$Label1.width                    = 40
$Label1.height                   = 10
$Label1.location                 = New-Object System.Drawing.Point(59,9)
$Label1.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',16,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$Label2                          = New-Object system.Windows.Forms.Label
$Label2.text                     = "SELECIONA A UNIDADE ORGANIZACIONAL!"
$Label2.AutoSize                 = $true
$Label2.width                    = 25
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(105,136)
$Label2.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

<#$Label3                          = New-Object system.Windows.Forms.Label
$Label3.text                     = "DIGITE O NOME CORRETO DO HOST"
$Label3.AutoSize                 = $true
$Label3.width                    = 25
$Label3.height                   = 10
$Label3.location                 = New-Object System.Drawing.Point(123,55)
$Label3.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',14,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))
#>
$TextBox1                        = New-Object system.Windows.Forms.TextBox
$TextBox1.multiline              = $false
$TextBox1.text                   = $env:computername
$TextBox1.width                  = 152
$TextBox1.height                 = 20
$TextBox1.location               = New-Object System.Drawing.Point(211,92)
$TextBox1.Font                   = New-Object System.Drawing.Font('Microsoft Sans Serif',12,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$Button1                         = New-Object system.Windows.Forms.Button
$Button1.text                    = "INGRESSAR"
$Button1.width                   = 137
$Button1.height                  = 70
$Button1.location                = New-Object System.Drawing.Point(293,173)
$Button1.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',12,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))


$cancelButton                    = New-Object System.Windows.Forms.Button
$cancelButton.Location           = New-Object System.Drawing.Point(293,275)
$cancelButton.Size               = New-Object System.Drawing.Size(75,23)
$cancelButton.Text               = 'SAIR'
$cancelButton.width              = 137
$cancelButton.height             = 47
$cancelButton.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$cancelButton.DialogResult       = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton               = $cancelButton
$form.Controls.Add($cancelButton)

[void]$ListBox1.Items.Add('W10_NOTEBOOK')
[void]$ListBox1.Items.Add('_NOTEBOOK')
[void]$ListBox1.Items.Add('PADRAO')
[void]$ListBox1.Items.Add('W10_DESKTOP')
[void]$ListBox1.Items.Add('_DESKTOP')
[void]$ListBox1.Items.Add('W7_DESKTOP')
[void]$ListBox1.Items.Add('W7_NOTEBOOK')


$Form.controls.AddRange(@($ListBox1,$Label1,$Label2,$Label3,$TextBox1,$Button1,$Button2))
$x = $ListBox1.SelectedItem

$Button1.Add_MouseClick({    
    Set-Variable -Name novohost -Value $TextBox1.text  
    $escolha = $ListBox1.SelectedItem
    if($escolha -eq $x){
        [System.Windows.MessageBox]::Show('SELECIONE UMA UO!!!','DOMINIO','OK','Error')
       # Write-Host "não escolheu"
       # Write-Host $escolha
    }else {
        #Write-Host $escolha
        #Write-Host "escolheu"
        msgboxaviso
    }
 })


function msgboxaviso {    
    $msgBoxInput =  [System.Windows.MessageBox]::Show("Realmente deseja adicionar esse host $novohost ao Domi�nio em $escolha ?",'Domi�nio','YesNo','Error')
    switch  ($msgBoxInput) {
        'Yes' {
            dominio_add   
        }        
        'No' {     
        }
                        }           
                                }           
function dominio_add {
    #write-host $escolha
   # write-host $novohost
   # write-host "INGRESSAR"
   $novohost = $TextBox1.text 
    switch ($escolha)
    {
        'PADRAO'{
            write-host "PADRAO"
            write-host $novohost

            Add-Computer -DomainName empresa.com.br -Restart 
        }
        'W10_DESKTOP'{
            write-host "W10_DESKTOP"
            write-host $novohost
            #Rename-Computer -NewName $novohost
            $localUO='"OU=Windows10,OU=Desktops,OU=empresa_Computadores,DC=empresa,DC=com,DC=br"'
            #Add-Computer -DomainName empresa.com.br -OUPath $localUO -Credential empresa.com.br\-wksadmin -Options JoinWithNewName,AccountCreate -Restart -Force
            Add-Computer -DomainName empresa.com.br -OUPath "OU=Windows10,OU=Desktops,OU=empresa_Computadores,DC=empresa,DC=com,DC=br" -Options AccountCreate -Restart -Force
            write-host $localUO
        }
        'W10_NOTEBOOK'{
            $localUO='"OU=Windows10,OU=Notebooks,OU=empresa_Computadores,DC=empresa,DC=com,DC=br"'
            write-host $novohost
            write-host $localUO
           Add-Computer -DomainName empresa.com.br -OUPath "OU=Windows10,OU=Notebooks,OU=empresa_Computadores,DC=empresa,DC=com,DC=br" -Options AccountCreate -Restart 
            
        }
        '_DESKTOP'{
            $localUO='"OU=localidade,OU=setor,OU=Desktops,OU=empresadois_Computadores,DC=empresa,DC=com,DC=br"'
            write-host $localUO
            Add-Computer -DomainName empresa.com.br  -OUPath "OU=localidade,OU=setor,OU=Desktops,OU=empresadois_Computadores,DC=empresa,DC=com,DC=br" -Options AccountCreate -Restart 
        }
        '_NOTEBOOK'{
            $localUO='"OU=localidade,OU=setor,OU=Notebooks,OU=empresadois_Computadores,DC=empresa,DC=com,DC=br"'
            write-host $localUO
            Add-Computer -DomainName empresa.com.br -OUPath "OU=localidade,OU=setor,OU=Notebooks,OU=empresadois_Computadores,DC=empresa,DC=com,DC=br" -Options AccountCreate -Restart 
        }
        'W7_DESKTOP'{
            $localUO='"OU=Windows7,OU=Desktops,OU=empresa_Computadores,DC=empresa,DC=com,DC=br"'
            write-host $localUO
            Add-Computer -DomainName empresa.com.br -OUPath "OU=Windows7,OU=Desktops,OU=empresa_Computadores,DC=empresa,DC=com,DC=br" -Options AccountCreate -Restart 
        }
        'W7_NOTEBOOK'{
            $localUO="OU=Windows7,OU=Notebooks,OU=empresa_Computadores,DC=empresa,DC=com,DC=br"
            write-host $localUO
            Add-Computer -DomainName empresa.com.br -OUPath "OU=Windows7,OU=Notebooks,OU=empresa_Computadores,DC=empresa,DC=com,DC=br" -Options AccountCreate -Restart 
        }
    }
} 

[void]$Form.ShowDialog()