# Persistently append the path : 1666343743 
function Add-Path([string]$path, [switch]$Confirm, [switch]$WhatIf) {
  $keyPath = 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment'
  $current = (Get-ItemProperty -Path $keyPath -Name path).path
  $delta = "$current;$Path"

  function save() {
    Set-ItemProperty -Path $keyPath -Name path -Value $delta
    $env:path = $delta
  }

  if(!(Test-Path $Path)) { throw "No such path: $Path" }
  elseif ( $env:path -contains $Path ) { throw "Path already contains $Path" }

  if($WhatIf) {
    "WhatIf: Saving permanent path: $delta"
  } elseif ( $Confirm ) { save } else {
    $Confirm = Read-Host -Prompt "Would you like to append $Path permanently to the EnVar?"
    if($Confirm -Match 'y') { save } else { "Cancelled" }
  }
}
