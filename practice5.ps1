New-Item -Path ".\Test" -ItemType Directory

# Teeme failid

Set-Content -Path ".\Test\example.csv" -Value "name,age`nMarkkus,21"
Set-Content -Path ".\Test\fail1.txt" -Value "example text"
Set-Content -Path ".\Test\fail2.txt" -Value "example text 1234"

# Valjastame kaustas olevad failid

Get-ChildItem -Path ".\Test"

# Votame kaustas oleva csv faili, et hiljem saaks nime jargi kutsuda

$csv = Get-ChildItem ".\Test\*" -File -Filter "*.csv"

# Arvutame suuruse KB ja MB'des

$sizeKB = $csv.Length/1KB
$sizeMB = $csv.Length/1MB

# Valjastame kasutajale informatsiooni

Write-Host "Filename: $($csv.Name)"
Write-Host "CSV size in KB : $sizeKB KB"
Write-Host "CSV size in MB : $sizeMB MB"