$Json_File_Path="C:\Users\psara\Downloads\powershell_sprint_must\startwars.json"

$var1=Get-Content -Path $Json_File_Path |ConvertFrom-Json

Write-Output $var1.count