# Silently install an application : 1666357466
function Install-Silent([string]$Path) {
  if(!(Test-Path $Path)) { throw "Could not find $Path" }
  cmd.exe /c "start /wait $Path /S"
}
