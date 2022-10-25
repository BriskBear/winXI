# Download installers for base Applications : 1666302874
function Get-Installer() {
  $edge = 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe'
  $links = Import-CSV -Path $PSScriptRoot\..\lib\urls.csv -Delimiter ' '

  $links.url | ForEach-Object {
    Start-Process -FilePath "$edge" -ArgumentList "$_"
  }
}
