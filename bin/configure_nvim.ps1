# Configure nvim with plugins : 1666358469
function CFG-Nvim() {
  $lad  = "$env:LocalAppData\nvim"
  $pf   = "$env:ProgramFiles\Neovim\bin\"
  $root = "$PSScriptRoot\.."

  if(!(Test-Path "$pf")) { mkdir -p "$pf" }

  7z x $root\lib\nvim.zip -o"$lad" -y
  Copy-Item -Force -Recurse -Path "$lad" -Destination 'C:\Users\Default\AppData\Local\'
  Copy-Item -Force -Verbose -Path $root\lib\code-minimap.exe -Destination "$pf"
}
