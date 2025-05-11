# Kontrollime, kas Active Directory on systeemis olemas, vastasel juhul skript ei toimi.

if (-not (Get-Module -ListAvailable -Name ActiveDirectory)) {
    Write-Host "Active Directory moodul puudub, palun paigaldage enne skripti kasutamist."
    exit
} else {
    Import-Module ActiveDirectory
}


$firstName = Read-Host "Sisesta AD kasutaja eesnimi"
$lastName = Read-Host "Sisesta AD kasutaja perekonnanimi"

$username = ("$firstName.$lastName").ToLower()

Write-Host "Kustutatav AD kasutaja on $username"

$password = ConvertTo-SecureString "Parool1!" -AsPlainText -Force

if (Get-ADUser -Filter {SamAccountName -eq $username} -ErrorAction SilentlyContinue) {
    Write-Host "Kasutaja '$username' on juba Active Directorys olemas." -ForegroundColor Red

} else {
    try {
        Remove-ADUser -Identity $username        
        if ($?) {
            Write-Host "Kasutaja '$username' kustutati Active Directoryst" -ForegroundColor Green
        } else {
            Write-Host "Tekkis viga kasutaja kustutamisel." -ForegroundColor Red
        }
    }
    catch {
        Write-Host "Viga: $_" -ForegroundColor Red
    }
}