# Kysime kasutajalt kaks arvu

$num1 = [decimal](Read-Host "Enter the first number")
$num2 = [decimal](Read-Host "Enter the second number")

# Naitame menyyd

Write-Host "`nChoose an operation:"
Write-Host "1. Addition"
Write-Host "2. Subtraction"
Write-Host "3. Division"
Write-Host "4. Multiplication"

# Salvestame muutujasse kasutaja valiku

$choice = Read-Host "Enter your choice (1-4)"

# Vastavalt soovitud numbrile teeme arvutused

switch ($choice) {
    '1' {
        $result = $num1 + $num2
        Write-Host "`nResult: $num1 + $num2 equals $result"
    }
    '2' {
        $result = $num1 - $num2
        Write-Host "`nResult: $num1 - $num2 equals $result"
    }
    '3' {
        $result = $num1 / $num2
        Write-Host "`nResult: $num1 : $num2 equals $result"
    }
    '4' {
        $result = $num1 * $num2
        Write-Host "`nResult: $num1 * $num2 equals $result"
    }
    default {
        Write-Host "Invalid. Select a number between 1 and 4."
    }
}
