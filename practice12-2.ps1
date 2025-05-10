# Kysime kasutajalt staatuse kas Running v6i Stopped (./skriptinimi.ps1 -status "Stopped/Running")

param (
    [string]$status
    )

# Teeme funktsioonid mis loevad kokku töötavad ja seisvad teenused

function countservice {
    param 
    (
        [string]$status
    )

    if ($status -eq "Running") {
        $runningServices = (Get-Service | Where-Object {$_.Status -eq 'Running'} | Measure-Object | Select-Object -ExpandProperty Count)
        Write-Host "Total services in running state = $runningServices"
    } else {
        $stoppedServices = (Get-Service | Where-Object {$_.Status -eq 'Stopped'} | Measure-Object | Select-Object -ExpandProperty Count)
        Write-Host "Total services in stopped state = $stoppedServices"
    }
}


# Kutsume funktsiooni tööle

countservice -status $status