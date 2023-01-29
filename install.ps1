$Destination_path = "$env:USERPROFILE\Documents\Tools"

# Create a folder if not exist
if (! (Test-Path $Destination_path)) {
    New-Item $Destination_path -ItemType Directory
}

# Download the file
Invoke-WebRequest -Uri "https://github.com/BlackcatRs/socat-1.7.3.0-windows/raw/master/socat.zip" -OutFile "$Destination_path\socat.zip"

# Unzip
Expand-Archive -Path "$Destination_path\socat.zip" -DestinationPath $Destination_path -Force

# Add the folder socat-1.7.3.0-windows-master path
$Old_env = (Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name path).Path
$New_env  =  "$Old_env;$Destination_path\socat-1.7.3.0-windows-master"

Set-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment' -Name path -Value $New_env

# Remove downloaded zip file
Remove-Item -Path "$Destination_path\socat.zip" -Force
