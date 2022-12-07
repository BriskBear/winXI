# Remove all WinApps except for Calculator and Store : 1666722617
function MS-Clean() {
  $keep = @($( Get-Content $PSScriptRoot\..\lib\keep.txt ))
  $packs = Get-AppXPackage 
  $cached = $ErrorActionPreference
  $errorActionPreference = 'SilentlyContinue' 

  $packs|ForEach-Object {
    if( $keep -NotContains "$($_.name)" ) { Remove-AppXPackage $_ }
  }
  $ErrorActionPreference = $cached
}
