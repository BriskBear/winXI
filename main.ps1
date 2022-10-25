# Run the functions built-in to the bin dir : 1666357757
$leaves = ls $PSScriptRoot\bin\*.ps1

$leaves | ForEach-Object {
  . $_.FullName
}

Get-Installer
Timeout 5
$installer = (Get-ChildItem "C:\Users\Public\Downloads\7*.exe").FullName
Install-Silent -Path $installer
Timeout 5
Add-Path -Path 'C:\Program Files\7-zip' -Confirm

CFG-Nvim
Set-Websearch -Disabled
MS-Clean
Unpin
Extract-Installer
