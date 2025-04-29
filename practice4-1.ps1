# Kysime kasutajalt kahte numbrit integer kujul, muidu programm
# vaatab ainult esimest numbrit

$firstValue = [int](Read-Host "Enter first value")
$secondValue = [int](Read-Host "Enter second value")

# v6rdleme vaartuseid ja anname kasutajale vastuse

if ($firstValue -gt $secondValue) {
    Write-Host "The higher number is: $firstValue"
} else {
    Write-Host "The higher number is: $secondValue"
}