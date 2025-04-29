# Voimalikud grupid/varvid
$colors = @("Red", "Green", "Yellow", "Blue")

# Votame koik 20 opilast ykshaaval
for ($i = 1; $i -le 20; $i++) {

    # Valime neile juhuslikult grupi arrayst $colors

    $group = Get-Random -InputObject $colors

    # Prindime vastuse
    Write-Host "$i $group"
}
