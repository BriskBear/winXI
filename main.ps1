# Run the functions built-in to the bin dir : 1666357757
# Find all function definitions in this project
$leaves = ls $PSScriptRoot\bin\*.ps1

# Load all Functions in this project
$leaves | ForEach-Object { . $_.FullName }

# Download installers in the lib/urls.csv file
Get-Installer
Timeout 5
$installer = (Get-ChildItem "C:\Users\Public\Downloads\7*.exe").FullName
# Silently install 7zip
Install-Silent -Path $installer
Timeout 5
# Add 7zip to the current-session path for later tools
Add-Path -Path 'C:\Program Files\7-zip' -Confirm

# Unpack and place the Neovim configuration
CFG-Nvim
# Disable the Start-search from searching the internet (way faster!)
Set-Websearch -Disabled
# Remove non-essential Windows 11 built-ins (There are a lot of those)
MS-Clean
# Unpin all the auto-pinned non-essentials from the start menu
Unpin
