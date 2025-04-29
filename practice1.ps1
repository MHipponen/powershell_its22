$array1 = @(1, 2, 3)
$array2 = @(4, 5, 6)

$array3 = @()

for ($i = 0; $i -lt $array1.Length; $i++) {
    $sum = $array1[$i] + $array2[$i]
    $array3 += $sum
}


Write-Output "Array1: $array1"
Write-Output "Array2: $array2"
Write-Output "Array3: $array3"