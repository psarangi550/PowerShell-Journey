$32_bit_siftwares=Get-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"

# Write-Output $32_bit_siftwares | Select-Object -Property "DisplayName","Publisher","Install Date"

$64_bit_software=Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*"

# Write-Output $64_bit_software | Select-Object -Property "DisplayName","Publisher","Install Date"

$all_installed_programs=$32_bit_siftwares+$64_bit_software


$url="https://www.win-rar.com/fileadmin/winrar-versions/winrar/winrar-x64-620.exe"

$destination_dir="C:\Users\psara\Downloads\powershell_sprint_must\software"

$installation_file=${destination_dir}+"\winrar.exe"

$software_name="winrar.exe"


if ($all_installed_programs.DisplayName -like "*$software_name*"){
    Write-Output "Found It"
    Exit;
}
else{
    Write-Output "Not Found It"
}

#installing the software

if (-not(Test-Path -Path $installation_file)){
    
    New-Item -Path  $destination_dir -ItemType Directory -Force
    Invoke-WebRequest -Uri $url  -OutFile $installation_file -Verbose
    Start-Process -FilePath $installation_file /S -NoNewWindow -Wait -PassThru
    Write-Host "Software Installed"
}
else{
    Write-Host "Software Already Installed"
    Exit;
}


