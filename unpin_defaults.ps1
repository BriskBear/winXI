function Unpin() {
  $cpath = "$env:LocalAppData\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy"

  cp -Force $PSScriptRoot\start.bin "$cpath\"
}
