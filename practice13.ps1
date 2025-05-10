function endScreen {
    Write-Host "Please select the next option" -ForegroundColor Green
    
    Write-Host "1: Return to main menu"
    Write-Host "2: Exit"
    $choice = Read-Host "`nEnter your choice: "
    if ($choice -eq 1) {
        menu
    } else {
        exit
    }
}

function menu {
    Write-Host "Please select the option to perform the respective task" -ForegroundColor Green

    Write-Host "`n1: Area of square"
    Write-Host "2: Area of rectangle"
    Write-Host "3: Area of circle"
    Write-Host "4: Area of triangle"
    Write-Host "5: Exit"

    $choice = Read-Host "Enter your choice: "

    switch ($choice) {
        "1" {
            [int]$squareSide = Read-Host "Enter the side of the square: "
            $area = [math]::Pow($squareSide, 2)
            Write-Host "Area size for a square with a side of $squareSide is $area"
            endScreen
        }
        "2" {
            [int]$rectangleFirstSide = Read-Host "Enter the width of the rectangle: "
            [int]$rectangleSecondSide = Read-Host "Enter the height of the rectangle: "
            $area = $rectangleFirstSide * $rectangleSecondSide
            Write-Host "Area size for a rectangle with a width of $rectangleFirstSide & a height of $rectangleSecondSide is $area"
            endScreen
        }
        "3" {
            [int]$circleRadius = Read-Host "Enter the radius of the rectangle: "
            $pi = [math]::PI
            $area = $pi * ($circleRadius * $circleRadius)
            Write-Host "Area size for a circle with a radius of $circleRadius is $area"
            endScreen
        }
        "4" {
            [int]$triangleBase = Read-Host "Enter the base of the triangle: "
            [int]$triangleHeight = Read-Host "Enter the height of the triangle: "
            $area = ($triangleBase * $triangleHeight) / 2
            Write-Host "Area size for a triangle with a base of $triangleBase and height of $triangleHeight is $area"
            endScreen
        }
        "5" {
            exit
        }
        default {
            Write-Host "Invalid selection, choose a valid option."
            menu
        }
    }
}
menu
