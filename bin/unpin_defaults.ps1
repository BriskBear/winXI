# Clear start-menu pins and recents : 1666264363
function Unpin() {
  $cpath = "$env:LocalAppData\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy"

  cp -Force $PSScriptRoot\..\lib\start.bin "$cpath\"
}
