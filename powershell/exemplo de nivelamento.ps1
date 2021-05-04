$caminho = "c:\"


$argumentos = @{
Path = $caminho
Name = $true
file = $true
}

Get-ChildItem @argumentos

Get-ChildItem $caminho


