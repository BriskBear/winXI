# Extract Installers too large for online-fetch : 1666359041
function Extract-Installer() {
  $installer = '\\gd-fs2.cppwind.local\it$\load\pkgs.zip'
  
  7z x $installer -o'C:\Users\Public\Downloads\' -y
}
