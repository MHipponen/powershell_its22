# Teeme funktsioonid mis loevad kokku töötavad ja seisvad teenused

function countstart {
    $runningServices = (Get-Service | Where-Object {$_.Status -eq 'Running'} | Measure-Object | Select-Object -ExpandProperty Count)
    Write-Host "Total services in running state = $runningServices"
}


function countstop {
    $stoppedServices = (Get-Service | Where-Object {$_.Status -eq 'Stopped'} | Measure-Object | Select-Object -ExpandProperty Count)
    Write-Host "Total services in stopped state = $stoppedServices"
}
# Kutsume funktsioonid tööle

countstart
countstop