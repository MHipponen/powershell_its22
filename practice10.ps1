
# do while loop kontrollimaks kas notepad tootab

do {
    if (Get-Process notepad -ErrorAction SilentlyContinue) {
        Write-Host "Notepad is running"
        $count += 1
    }
    Start-Sleep -Seconds 1
} until (-not (Get-Process notepad -ErrorAction SilentlyContinue))

# Teavitame kasutajat, et yhtegi notepadi enam ei toota

Write-Host "Teavitati $count korda"
