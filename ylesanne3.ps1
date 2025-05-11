# Kontrollime, kas Active Directory on systeemis olemas, vastasel juhul skript ei toimi.

if (-not (Get-Module -ListAvailable -Name ActiveDirectory)) {
    Write-Host "Active Directory moodul puudub, palun paigaldage enne skripti kasutamist."
    exit
} else {
    Import-Module ActiveDirectory
}


$firstName = Read-Host "Sisesta kasutaja eesnimi"
$lastName = Read-Host "Sisesta kasutaja perekonnanimi"

$username = ("$firstName.$lastName").ToLower()
$fullName = "$firstName $lastName"
Write-Host "Loodav kasutaja on $username"

$password = ConvertTo-SecureString "Parool1!" -AsPlainText -Force

if (Get-ADUser -Filter {SamAccountName -eq $username} -ErrorAction SilentlyContinue) {
    Write-Host "Kasutaja '$username' on juba Active Directorys olemas." -ForegroundColor Red

} else {
    New-LocalUser -Name $username -FullName $fullName -Password $password

    try {
        New-ADUser -SamAccountName $username -GivenName $eesnimi -Surname $perenimi -Name "$eesnimi $perenimi"
        
        if ($?) {
            Write-Host "Kasutaja '$username' loodi edukalt Active Directorys." -ForegroundColor Green
        } else {
            Write-Host "Tekkis viga kasutaja loomisel." -ForegroundColor Red
        }
    }
    catch {
        Write-Host "Viga: $_" -ForegroundColor Red
    }
}