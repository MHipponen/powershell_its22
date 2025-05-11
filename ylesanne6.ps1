$backupDir = "C:\Backup"

if (-not (Test-Path -Path $backupDir)) {
    New-Item -ItemType Directory -Path $backupDir
    Write-Host "Backup kaust on loodud: $backupDir"
}

$users = Get-LocalUser
$date = Get-Date -Format "dd.MM.yyyy"

foreach ($user in $users) {
    $userProfile = "C:\Users\$($user.Name)"
    
    if (Test-Path -Path $userProfile) {
        $backupFile = "$backupDir\$($user.Name)-$date.zip"
        
        Write-Host "Varundatakse kasutaja '$($user.Name)' kodukataloogi: $userProfile"

        try {
            Compress-Archive -Path $userProfile -DestinationPath $backupFile -Force
            Write-Host "Kasutaja '$($user.Name)' kodukataloog on edukalt varundatud: $backupFile"
        } catch {
            Write-Host "Viga varundamisel kasutajale '$($user.Name)': $($_.Exception.Message)" -ForegroundColor Red
        }
    } else {
        Write-Host "Kasutaja '$($user.Name)' kodukataloog ei eksisteeri: $userProfile" -ForegroundColor Yellow
    }
}

Write-Host "Varunduse protsess on l6ppenud."
