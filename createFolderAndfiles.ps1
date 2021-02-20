# Get path
$Global:currrentLocation = Get-Location

# Main folder
$Global:mainFolder = "Profiles"

# List with folders to create
$Global:fileWithFolderNames = "profiles.txt"

# Delete Profiles folder and its content
Remove-Item $Global:currrentLocation\$Global:mainFolder -Force -Recurse

# Create a new Profiles folder
New-Item -ItemType Directory -Path $Global:currrentLocation\$Global:mainFolder

# Get the names of the folders to create from text-file
$Global:foldersToCreate = Get-Content -Path $fileWithFolderNames

# Loop to create a folder for each item on the list
foreach ($folder in $Global:foldersToCreate) {
    New-Item -ItemType Directory -Path $Global:currrentLocation\$Global:mainFolder\$folder
} 

# Add 4 txt files to each subfolder
foreach($folder in Get-ChildItem $Global:currrentLocation\$Global:mainFolder) {
    for ($i=1; $i -lt 4; $i++) {
        New-Item -ItemType File $Global:currrentLocation\$Global:mainFolder\$folder\profile$i.txt
        Add-Content $Global:currrentLocation\$Global:mainFolder\$folder\profile$i.txt "This file should be here."
    }
    New-Item -ItemType File $Global:currrentLocation\$Global:mainFolder\$folder\fileToRemove.txt
    Add-Content $Global:currrentLocation\$Global:mainFolder\$folder\fileToRemove.txt "This file will be deleted."
}

# Add a file that needs to be deleted later to the main folder
New-Item -ItemType File $Global:currrentLocation\$Global:mainFolder\fileToRemove.txt

Add-Content $Global:currrentLocation\$Global:mainFolder\fileToRemove.txt "This file will be deleted."

# Remove the file to delete from current directory and all sub folders
Get-ChildItem . -recurse -include fileToRemove.txt | remove-item