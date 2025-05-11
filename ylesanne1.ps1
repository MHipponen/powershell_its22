$firstName = Read-Host "Sisesta kasutaja eesnimi"
$lastName = Read-Host "Sisesta kasutaja perekonnanimi"

$username = ("$firstName.$lastName").ToLower()
$fullName = "$firstName $lastName"
Write-Host "Loodav kasutaja on $username"

$password = ConvertTo-SecureString "Parool1!" -AsPlainText -Force

if (Get-LocalUser -Name $username -ErrorAction SilentlyContinue) {
    Write-Host "Kasutaja '$username' on juba olemas." -ForegroundColor Red

} else {
    New-LocalUser -Name $username -FullName $fullName -Password $password
    Write-Host "Lokaalne kasutaja '$username' on loodud."
}