# Import CSV
$studentsData = Import-Csv "C:\Users\win11-git\Desktop\powershell_tood\students.csv"

# M22ra tyyp
$processedStudents = $studentsData | ForEach-Object {
    $age = [int]$_.Age  # Teisendame numbri vanuseks, ilma ei funktsioneerinud
    $schoolType = if ($age -ge 4 -and $age -le 10) { "Junior" }
     elseif ($age -ge 11 -and $age -le 17) { "Senior" } 
     else { "Unknown" }

    [PSCustomObject]@{
        Name   = $_.Name
        School = $schoolType
    }
}

# N2itame tulemust
$processedStudents | Format-Table -AutoSize

# Export CSV
$processedStudents | Export-Csv "C:\Users\win11-git\Desktop\powershell_tood\student_school.csv" -NoTypeInformation
