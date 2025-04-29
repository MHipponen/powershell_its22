# Nime and daysworked
$hashtable1 = @{
    John = 12
    Joe = 20
    Mary = 18
}

# Name and SalaryPerDay
$hashtable2 = @{
    John = 100
    Joe = 120
    Mary = 150
}

# Name and Salary
$hashtable3 = @{}

# Loop arvutamiseks
foreach ($name in $hashtable1.Keys) {
    $salary = $hashtable1[$name] * $hashtable2[$name]
    $hashtable3[$name] = $salary
}

# Output
$hashtable3
