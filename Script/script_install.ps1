#if we want to get the Property of the `32bit installed system` then we can use it as below
$var32= Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\uninstall\* | ForEach-Object {
    Write-Output $_.DisplayName
}
#same goes for the 64bit system as below 
$var64= Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\uninstall\* | ForEach-Object {
    Write-Output $_.DisplayName
}
#selecting very few Property out of it 
#we can add them both to see whether the 32 bit and 64 bit present or not 
$total=$var32+$var64
# Write-Host $var64
# Write-Host $total
#here we can see the Output  in here 
$total -clike "Python*"
