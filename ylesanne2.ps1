
$firstName = Read-Host "Sisesta kasutaja eesnimi"
$lastName = Read-Host "Sisesta kasutaja perekonnanimi"

$username = ("$firstName.$lastName").ToLower()
Write-Host "Kustutatav kasutaja on $username"

if (Get-LocalUser -Name $username -ErrorAction SilentlyContinue) {
    try {
        Remove-LocalUser -Name $username -ErrorAction Stop
        Write-Host "Kasutaja '$username' on edukalt kustutatud."
    } catch {
        Write-Host "Viga: Tekkis probleem kasutaja kustutamisega"
    }
} else {
    New-LocalUser -Name $username -FullName $fullName -Password $password
    Write-Host "Lokaalne kasutaja '$username' on kustutatud."
}