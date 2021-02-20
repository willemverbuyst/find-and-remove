# Get path
$Global:currrentLocation = Get-Location

# Main folder
$Global:mainFolder = "Profiles"

# List with folders to create
$Global:fileWithfolderNames = "profiles.txt"

# Delete Profiles folder and its content
Remove-Item $Global:currrentLocation\$Global:mainFolder -Force -Recurse

# # Create a new Profiles folder
New-Item -ItemType Directory -Path $Global:currrentLocation\$Global:mainFolder

# # Get the names of th folders to create from text-file
$Global:foldersToCreate = Get-Content -Path $fileWithfolderNames

# # Loop to create a folder for each item on the list
foreach ($folder in $Global:foldersToCreate) {
    New-Item -ItemType Directory -Path $Global:currrentLocation\$Global:mainFolder\$folder
} 

foreach($folder in Get-ChildItem $Global:currrentLocation\Profiles) {
    New-Item -ItemType File $Global:currrentLocation\$Global:mainFolder\$folder\$fileWithfolderNames
}