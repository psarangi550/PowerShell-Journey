Import-Module "C:\Users\psara\Downloads\powershell_sprint_must\Script\config"

$dt=Get-Date -Format "yyyy-MM-dd"

Application-Log-Start $dt

Get-Service

Application-Log-Stop 