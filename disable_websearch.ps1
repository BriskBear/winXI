function Set-WebSearch([Switch]$Enabled, [Switch]$Disabled) {
  $PropName = 'BingSearchEnabled'
  $RegKey   = 'Search'
  $RegPath  = 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\'
  $State    = Check-Key -Path $RegPath -Key $RegKey -Property $PropName

  # Respond to Switch Parameters, else Toggle state
  if($Enabled){
    Set-ItemProperty -Path $RegPath$RegKey -Name $PropName -Value 1
    "Web Search was enabled"
  }elseif($Disabled){
    Set-ItemProperty -Path $RegPath$RegKey -Name $PropName -Value 0
    "Web Search was disabled"
  }else{
    Switch ($State) {
      "Enabled"  {
        Set-ItemProperty -Path $RegPath$RegKey -Name $PropName -Value 0
        "Web Search was disabled"
      }
      "Disabled" {
        Set-ItemProperty -Path $RegPath$RegKey -Name $PropName -Value 1
        "Web Search was enabled"
      }
      default    { Get-ItemProperty -Path $RegPath$RegKey }
    }
  }
  "Restart Computer to apply changes"
}

function Check-Key($Key, $Path, $Property) {
  $ErrorActionCached = $ErrorActionPreference
  $ErrorActionPreference = 'Stop'
  try{
    $PropValue = (Get-ItemProperty "$Path$Key"|findstr /i $Property).split(':')[1]
  } catch [System.Management.Automation.SessionStateException]{
    New-Item -Path $Path$Key
    New-ItemProperty -Path "$Path$Key" -Name $Property -Value 1 -PropertyType "DWORD"
    $PropValue = " 1"
  }

  if($PropValue -eq " 0") {
    "Disabled"
  }elseif($PropValue -eq " 1"){
    "Enabled"
  }else{
    $PropValue
  }
  $ErrorActionPreference = $ErrorActionCached
}
