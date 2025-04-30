# do while loop kontrollimaks kas notepad tootab

do {
    if (Get-Process notepad -ErrorAction SilentlyContinue) {
        Write-Host "Notepad is running"
    }
    Start-Sleep -Seconds 1
} while (Get-Process notepad -ErrorAction SilentlyContinue)

# Teavitame kasutajat, et yhtegi notepadi enam ei toota

Write-Host "All notepad instances are closed"
