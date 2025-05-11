
$firstName = Read-Host "Sisesta kasutaja eesnimi"
$lastName = Read-Host "Sisesta kasutaja perekonnanimi"

$username = ("$firstName.$lastName").ToLower()
$fullName = "$firstName $lastName"
Write-Host "Loodav kasutaja on $username"

# Kasutame System.Web moodilit parooli genereerimiseks
Add-Type -AssemblyName System.Web

$password = [System.Web.Security.Membership]::GeneratePassword(8,0)

# Teeme selle securestringiks, muidu ei t66ta

$securePassword = ConvertTo-SecureString $password -AsPlainText -Force

if (Get-LocalUser -Name $username -ErrorAction SilentlyContinue) {
    Write-Host "Kasutaja '$username' on juba olemas." -ForegroundColor Red

} else {
    try {
        New-LocalUser -Name $username -FullName $fullName -Password $securePassword
        Write-Host "Lokaalne kasutaja '$username' on loodud."
    }
    catch {
        Write-Host "Kasutaja loomine eba6nnestus." -ForegroundColor Red
    }
    
}