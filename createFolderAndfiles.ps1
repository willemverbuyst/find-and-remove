# Get path
$Global:currrentLocation = Get-Location

# Clear Profiles folder and its content
Remove-Item $Global:currrentLocation\Profiles -Force -Recurse

# Create a new Profiles folder
mkdir Profiles

# Get the list with folders to create
$Global:fileWithfolderNames = Get-Content -Path .\profiles.txt

# Loop to create a folder for each item on the list
foreach ($folder in $Global:fileWithfolderNames) {
    New-Item -ItemType Directory -Path $Global:currrentLocation\Profiles\$folder
} 