# Naitame kasutajale valikuid


Write-Host "Please select a country:"
Write-Host "1. USA"
Write-Host "2. Germany"
Write-Host "3. Australia"

# Ask the user for their selection
$choice = Read-Host "Enter the number corresponding to your country choice"

# Display the capital based on the user's choice
switch ($choice) {
    1 { Write-Host "The capital of the USA is Washington, D.C." }
    2 { Write-Host "The capital of Germany is Berlin." }
    3 { Write-Host "The capital of Australia is Canberra." }
    default { Write-Host "Invalid, select a number between 1-3" }
}
